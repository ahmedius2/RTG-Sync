import math
from algorithmFactory import Heuristics

RTGANG_SCALING_FACTOR = 1.1
RTGSYNCH_SCALING_FACTOR = 1.2

class RTA:
    def __init__ (self, numOfCores):
        self.M = numOfCores
        self.utils = range (1, numOfCores + 1)
        self.comparisonHash = {'bfc': {u: {} for u in self.utils},
                               'gpc': {u: {} for u in self.utils}}

        return

    def get_schedulability (self, taskset, policy, maxUtil):
        schedulability = -1

        if policy == 'rtgang':
            schedulability = self.__get_rtgang_schedulability (taskset, maxUtil)
        elif 'rtgsynch' in policy:
            schedulability = self.__get_rtgsynch_schedulability (taskset,
                                                        policy [-3:], maxUtil)

        assert (schedulability >= 0)
        return schedulability

    def __get_rtgsynch_schedulability (self, taskset, heuristic, maxUtil):
        hpTasks = []
        schedulableUtilization = 0
        periods = sorted (taskset.keys ())

        # Instantiate heuristics
        algoEngine = Heuristics (self.M)

        # RMS scheme: smaller period -> higher priority
        for p in periods:
            tasks = taskset [p]

            # We are in the clear for this task group. Generate virtual-gangs
            # using the specified heuristic.
            if heuristic == 'bfc':
                virtGangs = algoEngine.brute_force (tasks, p)
            elif heuristic == 'gpc':
                virtGangs = algoEngine.greedy_packing_compute (tasks, p)
            elif heuristic == 'gpp':
                virtGangs = algoEngine.greedy_packing_parallelism (tasks, p)
            else:
                raise ValueError, 'Unknown gang formation heuristic: %s', \
                                                                    heuristic

            self.comparisonHash [heuristic][maxUtil][p] = [tasks, virtGangs]
            netResponseTime = 0
            for g in virtGangs:
                schedulable, responseTime = self.__check_schedulability (g,
                        hpTasks, RTGSYNCH_SCALING_FACTOR)

                netResponseTime += responseTime
                if schedulable and netResponseTime <= p:
                    schedulableUtilization += g.u
                else:
                    break

            hpTasks += tasks

        schedulability = round (float (schedulableUtilization) / maxUtil, 3)

        return schedulability

    def __get_rtgang_schedulability (self, taskset, maxUtil):
        hpTasks = []
        schedulableUtilization = 0
        periods = sorted (taskset.keys ())

        # RMS scheme: smaller period -> higher priority
        for p in periods:
            tasks = taskset [p]

            netResponseTime = 0
            for t in tasks:
                schedulable, responseTime = self.__check_schedulability (t,
                        hpTasks, RTGANG_SCALING_FACTOR)

                netResponseTime += responseTime
                if schedulable and netResponseTime <= p:
                    schedulableUtilization += t.u
                else:
                    break

            hpTasks += tasks

        schedulability = round (float (schedulableUtilization) / maxUtil, 3)

        return schedulability

    def __check_schedulability (self, task, higherPriorityTasks, scalingFactor):
        '''
            r_new = task.c + sum_over_t_in_hp [(ceil (r_prev / period_of_t)) * t.c]
        '''
        schedulable = False
        r_prev = task.C * scalingFactor

        while (1):
            sumTerm = 0
            for hp in higherPriorityTasks:
                sumTerm += math.ceil (r_prev / hp.P) * hp.C
            r_new = task.C + sumTerm

            if r_new == r_prev or r_new >= task.P:
                if r_new == r_prev:
                    schedulable = True
                break

            r_prev = r_new

        return schedulable, r_new

    def dbg_print_heuristic_comparison (self):
        heuristics = self.comparisonHash.keys ()

        for u in self.utils:
            for p in self.comparisonHash [heuristics [0]][u]:
                report = 'U: %2d | P:%4d\n' % (u, p)
                compHash = {h: 0 for h in heuristics}
                for h in heuristics:
                    # report += '    Tasks: \t'
                    # report += '\n\t\t'.join (["%s" % t for t in self.comparisonHash [h][u][p][0]])
                    # report += '\n'
                    report += '\t%s\tGangs: ' % (h)
                    report += '\t'.join (['%s' % g for g in self.comparisonHash [h][u][p][1]])
                    compHash [h] += round (sum ([g.C for g in self.comparisonHash [h][u][p][1]]), 3)
                    report += '\n'

                if (sum (compHash.values ()) / compHash.values ()[0] / len (compHash.keys ())) != 1.0:
                    print '======> Watch Out!', compHash
                    print report
                    print '-----------------------------'

        return
