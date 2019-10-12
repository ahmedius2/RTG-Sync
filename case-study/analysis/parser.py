import os, sys, re

class Parser:
    def __init__ (self, debug = False):
        self.debug = debug
        self.parsedData = {}
        self.eventRegexP1 = r'^.* ([\d\.]+):(.*)$'
        self.eventRegexP2a = r'^.* rtg_([\D]+): comm=([^\s]+) rtgid=([\d]+).*$'
        self.eventRegexP2b = r'^.* gid=([\d]+): job_start.*$'

        return

    def parse (self, fileName):
        '''
            Data-Structure
                Hash [Gang-ID] = Hash [timeStamp-for-<Gang-ID>] = event

            i.e., we have a hash of hashes. The top-level hash is keyed by
            gang-id values. The inside hash contain key-value pairs with
            time-stamp for a particular gang as keys and their corresponding
            events as values.
        '''
        lines = []
        self.parsedData = {}
        self.__check_file_exists (fileName)

        with open (fileName, 'r') as fdi:
            lines = fdi.readlines ()

        for line in lines:
            l = re.match (self.eventRegexP1, line)

            if ('RTG-LIB' in line or 'sched_switch' in line):
                continue

            if l:
                timeStamp = float (l.group (1))
                remString = l.group (2)

                m = re.match (self.eventRegexP2a, remString)

                if m:
                    event = m.group (1)
                    task = m.group (2)
                    rtgid = int (m.group (3))
                else:
                    n = re.match (self.eventRegexP2b, remString)

                    if not n:
                        raise IOError, 'Unable to parse line: <%s>' % (line)

                    event = 'start'
                    rtgid = int (n.group (1))

                self.__insert_event_for_gang (rtgid, timeStamp, event)

        if self.debug:
            self.__debug_print_parsed_data_per_gang ()

        return self.parsedData

    def __insert_event_for_gang (self, gangId, timeStamp, event):
        if gangId in self.parsedData:
            if timeStamp in self.parsedData [gangId]:
                '''
                    This is a hack to artificially change the timestamp from
                    the log by a negligible delta (1 usec) in case there are
                    duplicate timestamps. Such an occurence is extremely
                    unlikey but it can happen since the data can come into
                    trace buffer simultaneously from different cores during the
                    experiment.

                    If this hack is not used, we may miss some critical RT-Gang
                    lock state transition event which can make the cleaner
                    module throw an invalid state transition error in the later
                    stages of analysis.
                '''
                timeStamp += 0.000001
            self.parsedData [gangId][timeStamp] = event
        else:
            self.parsedData [gangId] = {timeStamp:event}

        return

    def __check_file_exists (self, fileName):
        if not os.path.isfile (fileName):
            raise IOError, "File <%s> does not exists!" % (fileName)

    def __debug_print_parsed_data_per_gang (self):
        outputFormat = '%20s | %20s | %20s\n'

        for gang in self.parsedData:
            timeline = sorted (self.parsedData [gang].keys ())
            startTime = timeline [0]

            with open ('gid_%s.txt' % (gang), 'w') as fdo:
                headerLine = outputFormat % ('Timestamp', 'Offset (msec)',
                                            'Event')
                hrule = '-' * len (headerLine) + '\n'
                fdo.write (headerLine)
                fdo.write (hrule)

                for ts in timeline:
                    fdo.write (outputFormat % (ts,
                                    '%.3f' % ((ts - startTime) * 1000),
                                    self.parsedData [gang][ts]))

        return
