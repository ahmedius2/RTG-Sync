import math, random
from taskFactory import Task

class Generator:
    def __init__ (self, numOfCores):
        self.M = numOfCores

        return

    def create_taskset (self, tasksetType):
        taskset = {}
        cValues = []
        utilization = [u / 4.0 for u in range (4, 4 * self.M + 1)]

        for u in utilization:
            tid = 1
            remUtil = u
            taskset [u] = {}

            while remUtil > 0.01:
                # Pick period: T_i
                T = random.randint (10, 1500)
                if T not in taskset [u]:
                    taskset [u][T] = []

                while (tid % 5):
                    L, h, v, stop = self.gen_task_params (tasksetType, remUtil, T)
                    remUtil -= v
                    taskset [u][T].append (Task (tid, L, T, h, ''))
                    tid += 1
                    if stop: break
                else:
                    L, h, v, stop = self.gen_task_params (tasksetType, remUtil, T)
                    remUtil -= v
                    taskset [u][T].append (Task (tid, L, T, h, ''))
                    tid += 1

        return taskset

    def gen_task_params (self, tasksetType, remUtil, T):
        stop = False

        # Pick length: L_i
        L = random.randint (T / 10, T / 5)

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
            L = remUtil * T / h
            v = float (L) * h / T
            stop = True

        return L, h, v, stop

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
