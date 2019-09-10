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

    def bruteForce (self, virtualGangs, computeTimes):
        bestSystemComputeTime = sys.maxint
        bestVirtualGangCombinations = []

        for gangCombo in virtualGangs:
            gangs = self.__combo_to_gangs (gangCombo)

            comboComputeTime = 0
            for gang in gangs:
                comboComputeTime += computeTimes [gang]

            if comboComputeTime > bestSystemComputeTime:
                continue

            if comboComputeTime < bestSystemComputeTime:
                bestSystemComputeTime = comboComputeTime
                bestVirtualGangCombinations = [gangCombo]
                continue

            bestVirtualGangCombinations.append (gangCombo)

        return bestVirtualGangCombinations, bestSystemComputeTime

    def __combo_to_gangs (self, combo):
        return combo.split (',')
