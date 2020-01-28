'''
Virtual Gang Combination Generator

The purpose of this class is to create a generator object which can be used to
create virtual-gang combinations given a taskset; for a pre-specified number of
cores. It also estimates the execution time of each virtual-gang as per our
task model.

Copyright (C) 2019 KU-CSL
09-07-2019  Define generator class and its methods
09-09-2019  Add functionality to estimate gang execution times
'''
import sys, math
from taskFactory import Task

class CombinationGenerator:
    def __init__ (self, numOfSystemCores):
        self.M = numOfSystemCores

        return

    def generate_virtual_taskset (self, sysConfig, p):
        idx = 1
        taskset = []
        gangs = self.__config_to_gangs (sysConfig [0])

        for gang in gangs:
            tasks = self.__gang_to_tasks (gang)
            c = self.computeTimeHash [gang]
            n = len (tasks)
            u = 0
            m = 0
            r = 0
            memberList = []

            for task in tasks:
                m += self.parallelismHash [task]
                u += self.utilizationHash [task]
                r += self.resourceDemandHash [task]
                memberList.append (task)
                assert (m <= self.M)

            members = '-'.join (memberList)
            virtualGangTask = Task (idx, c, p, m, r, members, u, n, True)
            taskset.append (virtualGangTask)
            idx += 1

        return taskset

    def find_worst_corunner_gang (self, subjectTask, corunners):
        self.resourceDemandHash = {subjectTask.name: subjectTask.r}
        self.parallelismHash = {subjectTask.name: subjectTask.m}
        self.M -= subjectTask.m
        self.candidateSet = []
        self.gangHash = {}
        worstGang = ''
        maxDemand = 0

        for task in corunners:
            self.candidateSet.append (task.name)
            self.parallelismHash [task.name] = task.m
            self.resourceDemandHash [task.name] = task.r

        corunner_gangs = self.__generate_virtual_gangs (self.candidateSet)

        for g in corunner_gangs:
            if self.__has_multiple_tasks (g):
                m = self.__taskset_parallelism (g)
                g = '+'.join (g)
            else:
                m = self.parallelismHash [g]

            gang = '%s+%s' % (subjectTask.name, g)
            gangTasks = self.__gang_to_tasks (gang)
            demand = self.__calc_gang_demand (gangTasks)

            if demand > maxDemand:
                maxDemand = demand
                worstGang = gang

        # Restore M
        self.M += subjectTask.m

        return worstGang, maxDemand

    def generate_gang_combinations (self, taskset, debug = False):
        self.resourceDemandHash = {}
        self.parallelismHash = {}
        self.utilizationHash = {}
        self.computeTimeHash = {}
        self.candidateSet = []
        self.configHash = {}
        self.gangHash = {}

        for task in taskset:
            self.candidateSet.append (task.name)
            self.parallelismHash [task.name] = task.m
            self.utilizationHash [task.name] = task.u
            self.computeTimeHash [task.name] = task.C
            self.resourceDemandHash [task.name] = task.r

        combos = self.__generate_sys_configs (self.candidateSet)
        comboTimes = self.__calc_combination_times (combos)
        scalingFactors = self.__calc_combination_scaling_factor (combos)

        if debug:
            self.__dbg_print_gang_combinations (combos, len (taskset))

        return combos, comboTimes, scalingFactors

    def __generate_sys_configs (self, candidateSet):
        if len (candidateSet) == 1:
            return candidateSet

        anchorGang = candidateSet [0]
        newCandidateSet = candidateSet [1:]

        configSlots = [[anchorGang]]
        virtualGangs = self.__do_memoized_recursion (newCandidateSet,
                self.gangHash, 'virtual_gangs')

        for gang in virtualGangs:
            if self.__has_multiple_tasks (gang):
                configSlots.append ([anchorGang] + gang)
            else:
                configSlots.append ([anchorGang, gang])

        combinations = []
        for config in configSlots:
            cfgString = '+'.join (config)

            if self.__taskset_parallelism (config) > self.M:
                continue
            else:
                remainingTasks = [t for t in candidateSet if t not in config]
                if not remainingTasks:
                    combinations.append (cfgString)
                    continue

                subConfigs = self.__do_memoized_recursion (remainingTasks,
                        self.configHash, 'sys_configs')

                for cfg in subConfigs:
                    combinations.append ('%s,%s' % (cfgString, cfg))

        return combinations

    def __generate_virtual_gangs (self, candidateSet):
        if len (candidateSet) == 1:
            return candidateSet
        else:
            anchorTask = candidateSet [0]
            newCandidateSet = candidateSet [1:]
            subGangs = self.__do_memoized_recursion (newCandidateSet,
                    self.gangHash, 'virtual_gangs')

            virtualGangs = [anchorTask]
            for partialGang in subGangs:
                virtualGangs.append (partialGang)
                if self.__has_multiple_tasks (partialGang):
                    newGang = [anchorTask] + partialGang
                    if self.__taskset_parallelism (newGang) <= self.M:
                        virtualGangs.append (newGang)
                else:
                    newGang = [anchorTask, partialGang]
                    if self.__taskset_parallelism (newGang) <= self.M:
                        virtualGangs.append (newGang)

        return virtualGangs

    def __do_memoized_recursion (self, candidateSet, lookupHash, function):
        candidateSetStr = str (candidateSet)
        if candidateSetStr not in lookupHash:
            if function == 'sys_configs':
                solution = self.__generate_sys_configs (candidateSet)
            elif function == 'virtual_gangs':
                solution = self.__generate_virtual_gangs (candidateSet)
            else:
                raise ValueError, "Unrecognized recursive function: %s" % \
                            (function)

            lookupHash [candidateSetStr] = solution
        else:
            solution = lookupHash [candidateSetStr]

        return solution

    def __calc_max_configs (self, N, M):
        maxGangs = N
        numOfConfigs = 0
        minGangs = int (math.ceil (float (N) / M))

        for k in range (minGangs, maxGangs + 1):
            numOfConfigs += self.__calc_stirling_number (N, k)

        return numOfConfigs

    def __calc_stirling_number (self, n, k):
        # Table to store results of subproblems
        dp = [[0 for i in range(k + 1)]  for j in range(n + 1)]

        # Base cases
        for i in range (n + 1):
            dp [i][0] = 0

        for i in range (k + 1):
            dp [0][k] = 0

        # Fill rest of the entries in
        # dp [][] in bottom up manner
        for i in range (1, n + 1):
            for j in range (1, k + 1):
                if (j == 1 or i == j):
                    dp [i][j] = 1
                else:
                    dp [i][j] = (j * dp [i - 1][j] + dp [i - 1][j - 1])

        return dp [n][k]

    def __has_multiple_tasks (self, dataStructure):
        return isinstance (dataStructure, list)

    def __taskset_parallelism (self, taskset):
        parallelism = 0

        for task in taskset:
            parallelism += self.parallelismHash [task]

        return parallelism

    def __calc_combination_times (self, configs):
        for config in configs:
            gangs = self.__config_to_gangs (config)

            for gang in gangs:
                if gang in self.computeTimeHash:
                    continue

                gangTasks = self.__gang_to_tasks (gang)
                gangTime = self.__calc_gang_time (gangTasks)
                self.computeTimeHash [gang] = gangTime

        return self.computeTimeHash

    def __calc_combination_scaling_factor (self, configs):
        scalingFactors = {}

        for config in configs:
            gangs = self.__config_to_gangs (config)

            for gang in gangs:
                if gang in self.resourceDemandHash:
                    continue

                gangTasks = self.__gang_to_tasks (gang)
                gangDemand = self.__calc_gang_demand (gangTasks)
                self.resourceDemandHash [gang] = gangDemand

        for g in self.resourceDemandHash:
            scalingFactors [g] = 1 - max (self.resourceDemandHash [g] / 100, 1)

        return scalingFactors

    def __config_to_gangs (self, config):
        return config.split (',')

    def __gang_to_tasks (self, gang):
        return gang.split ('+')

    def __calc_gang_time (self, gang):
        gangExecTime = 0

        for task in gang:
            gangExecTime = max (self.computeTimeHash [task], gangExecTime)

        return gangExecTime

    def __calc_gang_demand (self, gang):
        gangDemand = 0

        for task in gang:
            gangDemand += self.resourceDemandHash [task]

        return gangDemand

    def __dbg_configs_to_slots (self, configs):
        slots = {}

        for config in configs:
            numOfSlots = len (self.__config_to_gangs (config))

            if numOfSlots in slots:
                slots [numOfSlots].append (config)
            else:
                slots [numOfSlots] = [config]

        return slots

    def __dbg_print_gang_combinations (self, configs, numOfTasks):
        slots = self.__dbg_configs_to_slots (configs)
        slotIds = sorted (slots.keys ())

        print
        netSerial = 1
        for numOfSlots in slotIds:
            print "Configurations with Gangs = %d" % (numOfSlots)

            serial = 1
            config = slots [numOfSlots]
            for cfg in config:
                print '\t%3d:%2d\t' % (netSerial, serial), cfg
                serial += 1
                netSerial += 1
            print

        calculatedMaxConfigs = self.__calc_max_configs (numOfTasks, self.M)
        print 'Calculated Max Configs: ', calculatedMaxConfigs

        return
