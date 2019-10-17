'''
Greedy Virtual-Gang Selection Algorithms

The purpose of this class is to provide approaches for selecting a virtual-gang
combination, out of numerous possiblities, to minimize the overall taskset
completion time.

Copyright (C) 2019 KU-CSL
09-09-2019  Define brute-force algorithm
'''

import sys

class Heuristics:
    def __init__ (self):
        return

    def rank_configurations (self, virtualGangs, computeTimes, debug = False):
        configTimesHash = {}

        for gangCombo in virtualGangs:
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

        return self.__print_ranked_configurations (configTimesHash, debug)

    def __print_ranked_configurations (self, configTimesHash, debug):
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

    def __combo_to_gangs (self, combo):
        return combo.split (',')
