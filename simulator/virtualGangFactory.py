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

class CombinationGenerator:
    def __init__ (self, numOfSystemCores):
        self.M = numOfSystemCores

        return

    def generate_gang_combinations (self, taskset, debug = False):
        self.candidateSet = []
        self.parallelismHash = {}
        self.computeTimeHash = {}

        for task in taskset:
            self.candidateSet.append (task.name)
            self.parallelismHash [task.name] = task.m
            self.computeTimeHash [task.name] = task.C

        combos = self.__generate_gang_combinations (self.candidateSet)
        comboTimes = self.__calc_combination_times (combos)

        if debug:
            self.__dbg_print_gang_combinations (combos)

        return combos, comboTimes

    def __generate_gang_combinations (self, candidateSet):
        if not candidateSet:
            return []

        if len (candidateSet) == 1:
            return candidateSet [0]

        anchorGang = candidateSet [0]
        newCandidateSet = candidateSet [1:]

        configSlots = [[anchorGang]]
        virtualGangs = self.__generate_virtual_gangs (newCandidateSet)

        if self.__has_multiple_items (virtualGangs):
            for gang in virtualGangs:
                if self.__has_multiple_items (gang):
                    configSlots.append ([anchorGang] + gang)
                else:
                    configSlots.append ([anchorGang, gang])
        else:
            configSlots.append ([anchorGang, virtualGangs])

        combinations = []
        for config in configSlots:
            cfgString = '+'.join (config)

            if self.__taskset_parallelism (config) > self.M:
                continue
            else:
                remainingTasks = list (set (candidateSet) - set (config))
                subConfigs = self.__generate_gang_combinations (remainingTasks)

                if subConfigs:
                    if self.__has_multiple_items (subConfigs):
                        for cfg in subConfigs:
                            combinations.append ('%s,%s' % (cfgString, cfg))
                    else:
                        combinations.append ('%s,%s' % (cfgString, subConfigs))
                else:
                    combinations.append (cfgString)

        return combinations

    def __generate_virtual_gangs (self, candidateSet):
        if len (candidateSet) == 1:
            return candidateSet [0]
        else:
            anchorTask = candidateSet [0]
            newCandidateSet = candidateSet [1:]
            subGangs = self.__generate_virtual_gangs (newCandidateSet)

            virtualGangs = [anchorTask]
            if self.__has_multiple_items (subGangs):
                for partialGang in subGangs:
                    virtualGangs.append (partialGang)
                    if self.__has_multiple_items (partialGang):
                        virtualGangs.append ([anchorTask] + partialGang)
                    else:
                        virtualGangs.append ([anchorTask, partialGang])
            else:
                virtualGangs.append (subGangs)
                virtualGangs.append ([anchorTask, subGangs])

        return virtualGangs

    def __has_multiple_items (self, dataStructure):
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

    def __config_to_gangs (self, config):
        return config.split (',')

    def __gang_to_tasks (self, gang):
        return gang.split ('+')

    def __calc_gang_time (self, gang):
        gangExecTime = 0

        for task in gang:
            gangExecTime = max (self.computeTimeHash [task], gangExecTime)

        return gangExecTime

    def __dbg_configs_to_slots (self, configs):
        slots = {}

        for config in configs:
            numOfSlots = len (self.__config_to_gangs (config))

            if numOfSlots in slots:
                slots [numOfSlots].append (config)
            else:
                slots [numOfSlots] = [config]

        return slots

    def __dbg_print_gang_combinations (self, configs):
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

        return
