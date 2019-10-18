'''
Greedy Virtual-Gang Selection Algorithms

The purpose of this class is to provide approaches for selecting a virtual-gang
combination, out of numerous possiblities, to minimize the overall taskset
completion time.

Copyright (C) 2019 KU-CSL
09-09-2019  Define brute-force algorithm
'''

import sys
from taskFactory import Task
from virtualGangFactory import CombinationGenerator

class Heuristics:
    def __init__ (self, M):
        self.M = M

        return

    def brute_force (self, tasks, p, debug = False):
        configTimesHash = {}
        gangFactory = CombinationGenerator (self.M)
        combos, computeTimes = gangFactory.generate_gang_combinations (tasks)

        for gangCombo in combos:
            gangs = self.__combo_to_gangs (gangCombo)
            numOfMembers = len (gangs)

            comboComputeTime = 0
            for gang in gangs:
                comboComputeTime += computeTimes [gang]

            if comboComputeTime in configTimesHash:
                if numOfMembers in configTimesHash [comboComputeTime]:
                    configTimesHash [comboComputeTime][numOfMembers].append (gangCombo)
                else:
                    configTimesHash [comboComputeTime][numOfMembers] = [gangCombo]
            else:
                configTimesHash [comboComputeTime] = {numOfMembers: [gangCombo]}

        bestConfig = self.__get_best_config (configTimesHash, debug)
        virtGangs = gangFactory.generate_virtual_taskset (bestConfig, p)

        return virtGangs

    def __get_best_config (self, configTimesHash, debug):
        rankedConfigs = {}
        sortedCompletionTimes = sorted (configTimesHash.keys ())
        rank = 1

        header = '%10s | %20s | %20s | %20s' % \
                ('Rank', 'Configuration', 'Completion Time', 'Member Count')

        if debug:
            print
            print '-' * len (header)
            print header
            print '-' * len (header)

        for time in sortedCompletionTimes:
            sortedMemberList = sorted (configTimesHash [time])

            for numOfMembers in sortedMemberList:
                configs = configTimesHash [time][numOfMembers]

                for cfg in configs:
                    if debug:
                        print '%10d | %20s | %20d | %20d' % (rank, cfg, time,
                                numOfMembers)
                    rankedConfigs [rank] = [cfg, time, numOfMembers]
                    rank += 1

        bestConfig = rankedConfigs [1][0]
        bestCompletionTime = rankedConfigs [1][1]

        if debug:
            print
            print '--------------------'
            print 'Brute-Force Solution'
            print '--------------------'
            print '\tBest Combination                : ', bestConfig
            print '\tOptimal Taskset Completion Time : ', bestCompletionTime
            print

        return bestConfig, bestCompletionTime

    def greedy_packing_compute (self, tasks, p):
        '''
            1. Sort tasks according to their compute times
            2. Pick longest task and pair with next longest tasks which can run
               with it in parallel. Continue doing this until no more tasks can
               be paired with the originally picked task
            3. Remove all tasks from the gang and push the gang into virt-gang
               set
            4. Continue from step 2 until taskset is empty
        '''
        # Trivial case
        if len (tasks) <= 1:
            return tasks

        # Step-1
        cHash = {}
        for t in tasks:
            if t.C in cHash:
                cHash [t.C].append (t)
            else:
                cHash [t.C] = [t]

        virtGangs = []
        sortedComputeTimes = sorted (cHash.keys ())
        sortedTasks = [t for c in sortedComputeTimes for t in cHash [c]]

        # Step-2 and 4
        while (sortedTasks):
            idx = 1
            task = sortedTasks.pop ()
            nidx = len (sortedTasks) - 1

            while (1):
                if task.m == self.M or nidx < 0:
                    # Step-3b
                    virtGangs.append (task)
                    idx += 1
                    break

                nTask = sortedTasks [nidx]
                if (task.m + nTask.m) <= self.M:
                    # Step-3a
                    del (sortedTasks [nidx])
                    task = Task (idx, task.C, task.P, task.m + nTask.m,
                            task.u + nTask.u, task.n + 1, True)

                nidx -= 1

        return virtGangs

    def __combo_to_gangs (self, combo):
        return combo.split (',')
