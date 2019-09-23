import os, re

class Parser:
    def __init__ (self):
        self.parsedData = {}
        self.eventRegex = r'^.* ([\d\.]+):.*rtg_([\D]+): gid=([\d]+) comm=([\D]+).*$'

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
            m = re.match (self.eventRegex, line)

            if m:
                timeStamp = float (m.group (1))
                event = m.group (2)
                gangId = int (m.group (3))
                self.__insert_event_for_gang (gangId, timeStamp, event)

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
