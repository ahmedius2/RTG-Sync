import sys, math
from taskFactory import Task
from algorithmFactory import Heuristics
from virtualGangFactory import CombinationGenerator

class RTA:
    def __init__ (self, numOfCores, utils, debug = False):
        self.debug = debug
        self.M = numOfCores
        self.gangFactory = CombinationGenerator (self.M)
        self.utils = utils

        return

    def analysis (self, taskset, scheduler, maxUtil):
        hpTasks = {}
        schedulableTasks = []
        periods = sorted (taskset.keys ())

        if 'threaded' in scheduler:
            taskset = self.__split_gangs_into_threads (taskset)

        if scheduler in ['gftp', 'threaded']:
            taskset = self.__deep_copy_taskset (taskset)

            if scheduler == 'gftp':
                taskset = self.__scale_taskset (taskset)
            elif scheduler == 'threaded':
                taskset = self.__scale_threadset (taskset)

        # RMS scheme: smaller period -> higher priority
        for p in periods:
            tasks = [t.copy () for t in taskset [p]]

            if scheduler == 'rtgang' or 'rtgsync' in scheduler:
                rta = self.__check_schedulability

                if 'rtgsync' in scheduler:
                    heuristic = scheduler [-3:]
                    algoEngine = Heuristics (self.M)

                    if heuristic == 'bfc':
                        scaling = 0 if 'ideal' in scheduler else 1
                        tasks = algoEngine.brute_force (tasks, p, scaling)
                    elif heuristic == 'gpc':
                        scaling = 'ideal' not in scheduler
                        tasks = algoEngine.greedy_packing_compute (tasks, p, scaling)
                    else:
                        raise ValueError, 'Unknown gang formation heuristic: %s' % (heuristic)

            elif scheduler in ['gftp', 'gftp-ideal', 'threaded', 'threaded-ideal']:
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
                    schedulable, responseTime = rta (t, hpTasks)

                    if schedulable:
                        schedulableTasks.append (t)
                        hpTasks [t] = responseTime
                    else:
                        return 0

        return 1

    def __split_gangs_into_threads (self, taskset):
        threadset = {}
        threadIdx = 1

        for p in taskset:
            threadset [p] = []
            for t in taskset [p]:
                for th in range (int (t.m)):
                    thread = Task (threadIdx, t.C, t.P, 1, t.r / t.m, '')
                    threadset [p].append (thread)
                    threadIdx += 1

        return threadset

    def __deep_copy_taskset (self, taskset):
        copied_taskset = {}

        for p in taskset:
            copied_taskset [p] = []

            for t in taskset [p]:
                copied_taskset [p].append (t.copy ())

        return copied_taskset

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

    def __scale_threadset (self, taskset):
        sorted_tasks = []
        scaling_factors = {}
        temp_taskset = [t for p in taskset for t in taskset [p]]
        sorted_resource_demands = list (set (sorted ([t.r for t in temp_taskset], reverse = True)))

        for r in sorted_resource_demands:
            for t in temp_taskset:
                if t.r == r:
                    sorted_tasks.append (t)
                    temp_taskset.remove (t)

        for p in taskset:
            for t in taskset [p]:
                worst_corunners = sorted_tasks [:self.M]

                if t in worst_corunners:
                    worst_corunners.remove (t)
                else:
                    del (worst_corunners [-1])

                max_demand = t.r + sum ([w.r for w in worst_corunners])
                scaling_factors [t] = max (1, max_demand / 100.0)

        for p in taskset:
            for t in taskset [p]:
                t.C *= scaling_factors [t]

        return taskset

    def __scale_taskset (self, taskset):
        scaling_factors = {}

        for p in taskset:
            for t in taskset [p]:
                if t.m == self.M:
                    # There cannot be any corunners of this task since it requires
                    # all the cores
                    scaling_factors [t] = 1.0
                    continue

                corunner_taskset = self.__get_corunners_of_task (t, taskset)

                if corunner_taskset != []:
                    scaling_factors [t] = self.__calc_task_scaling_factor (t, corunner_taskset)
                    continue

                scaling_factors [t] = 1.0

        for p in taskset:
            for t in taskset [p]:
                t.C *= scaling_factors [t]

        return taskset

    def __calc_task_scaling_factor (self, task, corunners):
        worst_gang, max_demand = self.gangFactory.find_worst_corunner_gang (task, corunners)
        scaling_factor = max (1, max_demand / 100.0)

        return scaling_factor

    def __get_corunners_of_task (self, subject_task, taskset):
        corunner_taskset = []

        for p in taskset:
            for t in taskset [p]:
                if t == subject_task:
                    continue

                if (t.m + subject_task.m) <= self.M:
                    corunner_taskset.append (t)

        return corunner_taskset

    def __dbg_print_taskset (self, taskset):
        for p in taskset:
            print '\tPeriod:', p
            for t in taskset [p]:
                print '\t\t', t

        return

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
