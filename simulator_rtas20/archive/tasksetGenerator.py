import math, random
from taskFactory import Task

class Generator:
    def __init__ (self, numOfCores, period):
        self.M = numOfCores
        self.P = float (period)

        return

    def create_taskset (self, tasksetType):
        taskset = {}
        utilization = [u + 1 for u in range (self.M)]

        for u in utilization:
            tid = 1
            taskset [u] = []
            maxSysVolume = self.P * u
            maxLightM = minTallM = math.ceil (0.3 * self.M)

            if tasksetType == 'light':
                maxTallUtil = 0.2 * u
                maxShortUtil = 0.8 * u

                # Generate short tasks
                shortTasks, tid = self.__generate_tasks (maxShortUtil, 1,
                        maxLightM, tid)
                taskset [u] += shortTasks

                # Generate tall tasks
                tallTasks, tid = self.__generate_tasks (maxTallUtil, minTallM,
                        self.M, tid)
                taskset [u] += tallTasks

            elif tasksetType == 'mixed':
                mixedTasks, tid = self.__generate_tasks (u, 1, self.M, tid)
                taskset [u] += mixedTasks

            elif tasksetType == 'heavy':
                maxTallUtil = 0.8 * u
                maxShortUtil = 0.2 * u

                # Generate short tasks
                shortTasks, tid = self.__generate_tasks (maxShortUtil, 1,
                        maxLightM, tid)
                taskset [u] += shortTasks

                # Generate tall tasks
                tallTasks, tid = self.__generate_tasks (maxTallUtil, minTallM,
                        self.M, tid)
                taskset [u] += tallTasks

        return taskset

    def print_taskset (self, taskset):
        tidx = 1

        for u in taskset:
            tasksetVolume = 0
            print '================ Utilization = %d' % (u)
            for t in taskset [u]:
                print '%3d: %s' % (tidx, t)
                tasksetVolume += t.C * t.m
                tidx += 1

            tasksetUtilization =  tasksetVolume / self.P
            print '    Taskset Utilization = %f' % (tasksetUtilization)
        return

    def __generate_tasks (self, maxUtil, minM, maxM, startTid):
        taskList = []
        tid = startTid
        tasksetUtil = 0

        while tasksetUtil < maxUtil:
            remainingUtil = maxUtil - tasksetUtil

            m = random.randint (minM, maxM)
            e = random.randint (100, 500)
            u = (m * e) / self.P

            # Make the last task fill the remaining volume
            if u > remainingUtil:
                e = (remainingUtil * self.P) / m
                u = remainingUtil

            taskList.append (Task (tid, e, m))
            tasksetUtil += u
            tid += 1

        return taskList, tid
