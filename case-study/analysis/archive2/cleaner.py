class Cleaner:
    def __init__ (self, debug = False):
        self.debug = debug
        self.data = {}

        return

    def extract_lock_duration (self, case, period, data):
        timeline = sorted (data.keys ())
        partialLockDuration = 0
        firstAcquire = True
        prevState = 'init'
        lockDurations = []
        windowStartTs = 0

        for ts in timeline:
            event = data [ts]

            if event == 'acquire':
                if prevState not in ['init', 'release']:
                    self.__raise_value_error ('Invalid Transition: <%s => %s>' % (prevState, 'acquire'))

                if firstAcquire:
                    windowStartTs = ts
                    firstAcquire = False
                elif (ts - windowStartTs) >= 0.050:
                    windowStartTs = ts
                    lockDurations.append (partialLockDuration * 1000)
                    partialLockDuration = 0
                else:
                    pass

                lockingStartTs = ts

            elif event == 'release':
                if not firstAcquire:
                    pass

                if prevState not in ['acquire']:
                    self.__raise_value_error ('Invalid Transition: <%s => %s>' % (prevState, 'release'))

                partialLockDuration += (ts - lockingStartTs)

            else:
                continue

            prevState = event

        return lockDurations

    def __raise_value_error (self, errorMsg):
        raise ValueError, errorMsg
