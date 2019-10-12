class Cleaner:
    def __init__ (self, debug = False):
        self.debug = debug
        self.data = {}

        return

    def extract_metric_from_data (self, case, period, gangId, data, metric):
        self.case = case
        self.data = data
        self.period = period
        self.gangId = gangId
        metricList = self.__get_lock_durations ()

        return metricList

    def __get_lock_durations (self):
        '''
            Parse gang-lock state machine to extract lock durations.

            The following state-transitions can happen at any time-instance
            w.r.t. the gang scheduling lock:

            ----------------------------------------------------------
            Trace Event   | Description
            ----------------------------------------------------------
            rtg_acquire   | Locking duration starts or resumes
            rtg_release   | Locking duration stops or gets updated
            rtg_block     | No impact on locking
            rtg_preemptor | rtg_acquire for preemptor gang
            rtg_preemptee | rtg_release for preempted gang
        '''

        timeline = sorted (self.data.keys ())
        periodicExecutionBegin = False
        partialLockDuration = 0
        lockDurations = []
        lockStartTime = 0
        state = 'init'
        nextState = ''

        if self.debug:
            fdo = open ('cleaner_%s_p%d_g%d.txt' % (self.case, self.period, self.gangId), 'w')
            outputFormat = '%15s | %15s | %15s | %20s | %20s\n'
            headerLine = outputFormat % ('Timestamp',
                                         'Offset (msec)',
                                         'Event',
                                         'Transition',
                                         'Partial Lock Duration')
            hrule = '-' * len (headerLine) + '\n'
            fdo.write (headerLine)
            fdo.write (hrule)

        startTime = timeline [0]

        for ts in timeline:
            newState = self.data [ts]
            self.__check_state_transition (ts, state, newState)

            if newState == 'start':
                newState = 'acquire'

                if periodicExecutionBegin:
                    if not partialLockDuration:
                        pass
                    else:
                        lockDurations.append (partialLockDuration * 1000)
                else:
                    periodicExecutionBegin = True

                partialLockDuration = 0

            elif newState == 'acquire' or newState == 'preemptor':
                lockStartTime = ts

            elif newState == 'release' or newState == 'preemptee':
                partialLockDuration += (ts - lockStartTime)

            elif newState == 'block':
                pass

            if self.debug:
                fdo.write (outputFormat %
                            (ts,
                             '%.3f' % ((ts - startTime) * 1000),
                             self.data [ts],
                             '%s => %s' % (state, newState),
                             '%.3f' % (partialLockDuration * 1000)))

            state = newState

        if self.debug:
            fdo.close ()

        return lockDurations

    def __raise_value_error (self, errorMsg):
        raise ValueError, '[C: %s | P: %d | G: %d] %s' % (self.case,
                self.period, self.gangId, errorMsg)

    # Verify if transition from prev -> cur is allowed
    def __check_state_transition (self, ts, prev, cur):
        transitionMap = {
                'init'      : ['acquire', 'preemptor', 'block'],
                'acquire'   : ['start', 'release', 'preemptee'],
                'preemptor' : ['start', 'release', 'preemptee'],
                'release'   : ['acquire', 'preemptor', 'block'],
                'block'     : ['acquire', 'block'],
                'preemptee' : ['acquire', 'block']
        }

        if cur not in transitionMap [prev]:
            self.__raise_value_error ('(%f) Transition not allowed: <%s => %s>' %
                                        (ts, prev, cur))

        return
