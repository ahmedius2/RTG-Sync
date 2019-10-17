import math, random
from taskFactory import Task

class Generator:
    def __init__ (self, numOfCores):
        self.M = numOfCores

        return

    def create_taskset (self, tasksetType):
        taskset = {}
        utilization = [u + 1 for u in range (self.M)]

        for u in utilization:
            remUtil = u
            taskset [u] = {}

            while remUtil > 0.001:
                tid = 1
                while (1):
                    p = random.randint (500, 1500)
                    if p not in taskset [u]:
                        taskset [u][p] = []
                        break

                while tid < 8:
                    if tasksetType == 'mixed':
                        m = random.randint (1, self.M)
                    elif tasksetType == 'light':
                        m = random.randint (1, math.ceil (0.3 * self.M))
                    elif tasksetType == 'heavy':
                        m = random.randint (math.ceil (0.3 * self.M), self.M)
                    else:
                        raise ValueError, 'Unexpected taskset type: %s' % (tasksetType)

                    e = random.randint (10,  p * u / self.M)
                    v = e * m / float (p)

                    if v > remUtil:
                        e = remUtil * p / float (m)
                        v = remUtil

                    remUtil -= v
                    taskset [u][p].append (Task (tid, e, p, m))
                    tid += 1

                    if remUtil < 0.001:
                        self.__verify_taskset (taskset, u)
                        break

        return taskset

    def __verify_taskset (self, taskset, u):
        v = 0.0
        for p in taskset [u]:
            for t in taskset [u][p]:
                v += (t.C * t.m / float (p))

        if (u - v) > 0.001:
            raise ValueError, 'Utilization not met: u=%.3f | v=%.3f' % (u, v)

        return

    def print_taskset (self, taskset):
        tidx = 1
        for u in taskset:
            v = 0
            print
            for p in taskset [u]:
                print
                for t in taskset [u][p]:
                    v += (t.C * t.m / float (p))
                    print 'T=%2d: U=%d | P=%4d | V=%.3f | %s' % (tidx, u, p, v, t)
                    tidx += 1

        return
