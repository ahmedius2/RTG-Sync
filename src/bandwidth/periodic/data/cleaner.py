class Cleaner:
    def __init__ (self):
        self.data = {}

        return

    def extract_metric_from_data (self, data, metric):
        self.data = data
        metricList = self.__get_lock_durations ()

        return metricList

    def __get_lock_durations (self):
        sortedTimeStamps = sorted (self.data.keys ())
        numOfTimeStamps = len (sortedTimeStamps)
        lockDurations = []

        for idx in xrange (0, numOfTimeStamps, 2):
            lockTime = sortedTimeStamps [idx]
            self.__check_event_is_acquire (self.data [lockTime], lockTime)
            lockDurations.append (sortedTimeStamps [idx + 1] - lockTime)

        # lockDurationMsec = [x * 1000000 for x in lockDurations if x > 0.00005 and x < 0.0005]
        lockDurationMsec = [x * 1000 for x in lockDurations if x > 0.001 and x < 0.01]

        return lockDurationMsec

    def __check_data_integrity (self):
        sortedTimeStamps = sorted (self.data.keys ())
        nextEvent = {'acquire': 'release', 'release': 'acquire'}

        prevEvent = ''
        for ts in sortedTimeStamps:
            thisEvent = self.data [ts]

            if prevEvent == '':
                prevEvent = thisEvent
                continue
            else:
                if thisEvent not in nextEvent:
                    raise ValueError,                                       \
                        '[UNRECOGNIZED] <%f> Name: %s'                      \
                        % (ts, thisEvent)

                if thisEvent != nextEvent [prevEvent]:
                    raise ValueError,                                       \
                        '[UNEXPECTED] <%f> Xpected: %s | Got: %s | Prev: %s'\
                        % (ts, nextEvent [prevEvent], thisEvent, prevEvent)

                prevEvent = thisEvent

        return

    def __check_event_is_acquire (self, event, ts):
        if event != 'acquire':
            raise ValueError,                                               \
                    '[UNEXPECTED] <%f> Not a lock-acquisition: %s'          \
                    % (ts, event)

        return

    def __is_odd (self, number):
        return (number % 2)
