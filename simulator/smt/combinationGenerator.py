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

    def find_worst_corunner_gang(self, subjectTask, corunners):
        self.resourceDemandHash = {subjectTask.name: subjectTask.r}
        self.parallelismHash = {subjectTask.name: subjectTask.h}
        self.M -= subjectTask.h
        self.candidateSet = []
        self.gangHash = {}
        worstGang = ''
        maxDemand = 0

        for task in corunners:
            self.candidateSet.append(task.name)
            self.parallelismHash[task.name] = task.h
            self.resourceDemandHash[task.name] = task.r

        corunner_gangs = self.__generate_virtual_gangs(self.candidateSet)

        for g in corunner_gangs:
            if self.__has_multiple_tasks(g):
                m = self.__taskset_parallelism(g)
                g = '+'.join(g)
            else:
                m = self.parallelismHash[g]

            gang = '%s+%s' % (subjectTask.name, g)
            gangTasks = self.__gang_to_tasks(gang)
            demand = self.__calc_gang_demand(gangTasks)

            if demand > maxDemand:
                maxDemand = demand
                worstGang = gang

        # Restore M
        self.M += subjectTask.h

        return worstGang, maxDemand

    def __generate_virtual_gangs(self, candidateSet):
        if len(candidateSet) == 1:
            return candidateSet
        else:
            anchorTask = candidateSet[0]
            newCandidateSet = candidateSet[1:]
            subGangs = self.__do_memoized_recursion(newCandidateSet,
                    self.gangHash, 'virtual_gangs')

            virtualGangs = [anchorTask]
            for partialGang in subGangs:
                virtualGangs.append(partialGang)
                if self.__has_multiple_tasks(partialGang):
                    newGang = [anchorTask] + partialGang
                    if self.__taskset_parallelism(newGang) <= self.M:
                        virtualGangs.append(newGang)
                else:
                    newGang = [anchorTask, partialGang]
                    if self.__taskset_parallelism(newGang) <= self.M:
                        virtualGangs.append (newGang)

        return virtualGangs

    def __do_memoized_recursion(self, candidateSet, lookupHash, function):
        candidateSetStr = str(candidateSet)
        if candidateSetStr not in lookupHash:
            if function == 'virtual_gangs':
                solution = self.__generate_virtual_gangs(candidateSet)
            else:
                raise ValueError, "Unrecognized recursive function: %s" % \
                            (function)

            lookupHash[candidateSetStr] = solution
        else:
            solution = lookupHash[candidateSetStr]

        return solution

    def __has_multiple_tasks(self, dataStructure):
        return isinstance(dataStructure, list)

    def __taskset_parallelism(self, taskset):
        parallelism = 0

        for task in taskset:
            parallelism += self.parallelismHash[task]

        return parallelism

    def __gang_to_tasks (self, gang):
        return gang.split ('+')

    def __calc_gang_demand(self, gang):
        gangDemand = 0

        for task in gang:
            gangDemand += self.resourceDemandHash[task]

        return gangDemand
