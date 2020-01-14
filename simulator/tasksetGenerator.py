import math, random
from taskFactory import Task

class Generator:
    def __init__ (self, numOfCores):
        self.M = numOfCores

        return

    def create_taskset (self, tasksetType):
        taskset = {}
        cValues = []
        utilization = [u / 2.0 for u in range (1, 2 * self.M + 1)]

        for u in utilization:
            remUtil = u
            taskset [u] = {}

            while 1:
                tid = 1

                # Pick period: T_i
                T = random.randint (10, 1500)
                if T not in taskset [u]:
                    taskset [u][T] = []

                # Pick length: L_i
                L = random.randint (T / 10, T)

                # Pick height based on taskset type
                if tasksetType == 'mixed':
                    h = random.randint (1, self.M)
                elif tasksetType == 'light':
                    h = random.randint (1, math.ceil (0.3 * self.M))
                elif tasksetType == 'heavy':
                    h = random.randint (math.ceil (0.3 * self.M), self.M)
                else:
                    raise ValueError, 'Unexpected taskset type: %s' % (tasksetType)

                # Calculate utilization: U_i
                v = float (L) * h / T

                if v > remUtil:
                    break

                remUtil -= v
                taskset [u][T].append (Task (tid, L, T, h, ''))
                tid += 1

        return taskset

    def print_taskset (self, taskset):
        tidx = 1
        for u in taskset:
            v = 0
            print
            for p in taskset [u]:
                print
                for t in taskset [u][p]:
                    v += (t.C * t.m / p)
                    print 'T=%2d: U=%d | P=%4d | V=%.3f | %s' % (tidx, u, p, v, t)
                    tidx += 1

        return
