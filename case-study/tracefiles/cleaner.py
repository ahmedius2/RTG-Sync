class Cleaner:
    def __init__ (self):
        self.data = {}

        return

    def extract_metric_from_data (self, gangId, data, metric):
        self.data = data
        self.gangId = gangId
        metricList = self.__get_lock_durations ()

        return metricList

    def __get_lock_durations (self):
        '''
            Parse gang-lock state machine to extract lock durations.

            The following state-transitions can happen at any time-instance
            w.r.t. the gang scheduling lock:

            ----------------------------------------------------------------
            State Transition  |   Trace Event   | Description
            ----------------------------------------------------------------
            Lock Acquisition  |   rtg_acquire   | Locking duration begins
            Lock Release      |   rtg_release   | Locking duration ends  
            Lock Blocking     |   rtg_block     | No impact on locking
        '''

        sortedTimeStamps = sorted (self.data.keys ())
        lockDurations = []
        state = 'init'
        nextState = ''

        for ts in sortedTimeStamps:
            newState = self.data [ts]

            if state == 'init' and newState != 'acquire':
                self.raiseValueError ('First transition must be lock-acquire: %s' % newState)

            # Acquire -> Start: Job is starting
            # Any other acquire is un-interesting
            #
            # Release -> Acquire -> Start: Previous job has ended
            # Any other release is un-interesting
            if newState == 'acquire':
                lockAcquireTime = ts
                if state == 'init':
                    nextState = 'i->a'
                elif state == 'r':
                    nextState = 'r->a'

            if newState == 'start':
                if state == 'i->a':
                    nextState = 's'
                    lockStartTime = lockAcquireTime

                if state == 'r->a':
                    nextState = 's'
                    prevLockDuration = (lockReleaseTime - lockStartTime) * 1000
                    lockDurations.append (prevLockDuration)
                    lockStartTime = lockAcquireTime

            if newState == 'release':
                if state == 's' or state == 'r->a':
                    nextState = 'r'
                    lockReleaseTime = ts

            if not nextState:
                raiseValueError ('Unexpected transition: <%s => %s>' % (state, newState))

            state = nextState

        return lockDurations

    def raiseValueError (self, errorMsg):
        raise ValueError, '[Gang: %d] %s' % (self.gangId, errorMsg)
