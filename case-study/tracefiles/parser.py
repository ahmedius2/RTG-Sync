import os, sys, re

class Parser:
    def __init__ (self):
        self.parsedData = {}
        self.eventRegexP1 = r'^.* ([\d\.]+):(.*)$'
        self.eventRegexP2a = r'^.* rtg_([\D]+): comm=([\D]+) rtgid=([\d]+).*$'
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

            if l:
                timeStamp = float (l.group (1))
                remString = l.group (2)

                m = re.match (self.eventRegexP2a, remString)

                if m:
                    event = m.group (1)
                    task = m.group (2)
                    rtgid = int (m.group (3))
                else:
                    if ('RTG-LIB' in remString):
                        continue

                    n = re.match (self.eventRegexP2b, remString)

                    if not n:
                        raise IOError, 'Unable to parse line: <%s>' % (line)

                    event = 'start'
                    rtgid = int (n.group (1))

                self.__insert_event_for_gang (rtgid, timeStamp, event)

        return self.parsedData

    def __insert_event_for_gang (self, gangId, timeStamp, event):
        if gangId in self.parsedData:
            self.parsedData [gangId][timeStamp] = event
        else:
            self.parsedData [gangId] = {timeStamp:event}

        return

    def __check_file_exists (self, fileName):
        if not os.path.isfile (fileName):
            raise IOError, "File <%s> does not exists!" % (fileName)
