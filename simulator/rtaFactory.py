import sys, math
from algorithmFactory import Heuristics

RTGANG_SCALING_FACTOR = 1.1
COSCHED_SCALING_FACTOR = 2.0
RTGSYNCH_SCALING_FACTOR = 1.2

class RTA:
    def __init__ (self, numOfCores, debug = False):
        self.debug = debug
        self.M = numOfCores
        self.utils = range (1, numOfCores + 1)
        self.comparisonHash = {'bfc': {u: {} for u in self.utils},
                               'gpc': {u: {} for u in self.utils}}

        return

    def get_schedulability (self, taskset, scheduler, maxUtil, w):
        schedulableUtil = self.__response_time_analysis (taskset, scheduler, maxUtil, w)
        schedulability = round (float (schedulableUtil) / maxUtil, 3)

        return schedulability

    def __response_time_analysis (self, taskset, scheduler, maxUtil, w):
        hpTasks = {}
        check = True
        schedulableUtilization = 0
        periods = sorted (taskset.keys ())

        # RMS scheme: smaller period -> higher priority
        schedulableTasks = []
        for p in periods:
            tasks = [t.copy () for t in taskset [p]]

            if scheduler == 'rtgang':
                scalingFactor = RTGANG_SCALING_FACTOR
                rta = self.__check_schedulability
            elif 'rtgsynch' in scheduler:
                heuristic = scheduler [-3:]
                algoEngine = Heuristics (self.M)
                rta = self.__check_schedulability
                scalingFactor = RTGSYNCH_SCALING_FACTOR

                if heuristic == 'bfc':
                    tasks = algoEngine.brute_force (tasks, p)
                elif heuristic == 'gpc':
                    tasks = algoEngine.greedy_packing_compute (tasks, p)
                elif heuristic == 'gpp':
                    tasks = algoEngine.greedy_packing_parallelism (tasks, p)
                else:
                    raise ValueError, 'Unknown gang formation heuristic: %s' % \
                                                                    (heuristic)
                # Keep track of created gangs for comparison
                self.comparisonHash [heuristic][maxUtil][p] = [taskset [p],
                                                               tasks]
                if self.debug:
                    with open ('debug/%s_%s_%d.txt' % (w, heuristic, maxUtil), 'a') as fdo:
                        fdo.write ('\n============== Period: %d\n' % p)
                        fdo.write ('\n\t\t'.join (['%s' % t for t in taskset [p]]))
                        fdo.write ('\n\t\t\t--------------\n')
                        fdo.write ('\n'.join (['%s' % t for t in tasks]))

            elif scheduler == 'gangftp':
                scalingFactor = COSCHED_SCALING_FACTOR
                rta = self.__check_schedulability_gftp
            else:
                raise ValueError, 'Unkown scheduler: %s' % (scheduler)

            # Scheduling jobs of the same period - SJF policy
            keys = sorted (list (set ([t.C for t in tasks])))
            pQueues = {k: [] for k in keys}

            # Populate priority-queues
            for k in keys:
                for t in tasks:
                    if t.C == k:
                        pQueues [k].append (t)

            unschedulableTasks = []
            for k in keys:
                for t in pQueues [k]:
                    # Scale execution time of the gang as per the scaling-factor
                    t.C *= scalingFactor
                    schedulable, responseTime = rta (t, hpTasks)

                    if schedulable:
                        schedulableTasks.append (t)
                        schedulableUtilization += t.u
                        hpTasks [t] = responseTime
                    else:
                        unschedulableTasks.append (t)
                        check = False
                        break

                if not check:
                    if self.debug and 'rtgsynch' in scheduler:
                        with open ('debug/%s_%s_%d.txt' % (w, heuristic, maxUtil), 'a') as fdo:
                            fdo.write ('\n\n ******************* Unschedulable Tasks\n')
                            fdo.write ('\n'.join (['%s' % t for t in unschedulableTasks]))

                            fdo.write ('\n\n ******************* Schedulable Tasks\n')
                            fdo.write ('\n'.join (['%s' % t for t in schedulableTasks]))
                    break

            if not check:
                break

        return schedulableUtilization

    def __check_schedulability (self, tk, hpTasks):
        '''
            r_new = tk.c + sum_over_t_in_hp [(ceil (r_prev / period_of_t)) * t.c]
        '''
        schedulable = False
        rk_prev = tk.C

        while (1):
            interferenceFactor = \
                    sum ([math.ceil (rk_prev / ti.P) * ti.C for ti in hpTasks])
            rk_new = tk.C + interferenceFactor

            if rk_new == rk_prev or rk_new >= tk.P:
                if rk_new == rk_prev:
                    schedulable = True
                break
            rk_prev = rk_new

        return schedulable, rk_new

    def __check_schedulability_gftp (self, tk, hpTasks):
        schedulable = False
        rk_prev = tk.C

        iIk = self.__calc_task_iIk (tk, hpTasks)
        while (1):
            iWk = self.__calc_workload_iWk (rk_prev, hpTasks)
            interferenceFactor = sum ([iIk [ti] * iWk [ti] for ti in hpTasks])
            rk_new = tk.C + math.floor (interferenceFactor)

            if rk_new == rk_prev or rk_new > tk.P:
                if rk_new == rk_prev:
                    schedulable = True
                break
            rk_prev = rk_new

        return schedulable, rk_new

    def __calc_workload_iWk (self, t, hpTasks):
        iWk = {}
        for ti in hpTasks:
            delta_i = ti.P - hpTasks [ti] + ti.C

            if t <= delta_i:
                iWk [ti] = min (t, ti.C)
            else:
                iWk [ti] = ti.C + ti.C * \
                           math.floor (float (t - delta_i) / ti.P) + \
                           min (ti.C, (t - delta_i) % ti.P)

        return iWk

    def __calc_task_iIk (self, tk, hpTasks):
        iIk = {}
        for ti in hpTasks:
            iIk [ti] = float (min (ti.m, self.M - tk.m + 1)) / \
                    (self.M - tk.m + 1)

        return iIk

    def dbg_print_heuristic_comparison (self):
        heuristics = self.comparisonHash.keys ()

        for u in self.utils:
            for p in self.comparisonHash [heuristics [0]][u]:
                report = 'U: %2d | P:%4d\n' % (u, p)
                compHash = {h: 0 for h in heuristics}
                report += '\t\t\t\tCandidate-Set\n\t\t'
                report += '\n\t\t'.join (["%s" % t for t in self.comparisonHash [heuristics [0]][u][p][0]])
                report += '\n\n'

                for h in heuristics:
                    report += '\t%s\tGangs: ' % (h)
                    report += '\t'.join (['%s' % g for g in self.comparisonHash [h][u][p][1]])
                    compHash [h] += round (sum ([g.C for g in self.comparisonHash [h][u][p][1]]), 3)
                    report += '\n'

                if (sum (compHash.values ()) / compHash.values ()[0] / len (compHash.keys ())) != 1.0:
                    print '======> Watch Out!', compHash
                    print report
                    print '-----------------------------'

        return
