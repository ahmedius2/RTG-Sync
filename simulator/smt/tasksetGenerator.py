import math, random
from taskFactory import Task

class Generator:
    def __init__ (self, numOfCores, utils, tasks_per_period = False):
        self.tpp = tasks_per_period
        self.M = numOfCores
        self.U = utils

        return

    def create_taskset(self, tasksetType):
        taskset = {}
        cValues = []

        for u in self.U:
            tid = 1
            remUtil = u
            taskset[u] = {}

            while remUtil > 0.01:
                # Pick period: T_i
                T = random.randint(10, 1500)
                if T not in taskset[u]:
                    taskset[u][T] = []

                # Randomly select the number of tasks to generate for the current period
                tasks_per_period = random.randint(2, 5) if not self.tpp else self.tpp

                while (tid % tasks_per_period):
                    task, remUtil, stop = self.gen_task_params(tasksetType, remUtil, T, tid)
                    taskset[u][T].append(task)
                    tid += 1
                    if stop: break
                else:
                    task, remUtil, stop = self.gen_task_params(tasksetType, remUtil, T, tid)
                    taskset[u][T].append(task)
                    tid += 1

        return taskset

    def gen_task_params(self, tasksetType, remUtil, T, tid):
        stop = False

        # Pick length: L_i
        L = random.randint(T/10, T/5)

        # Pick height based on taskset type
        if tasksetType == 'mixed':
            h = random.randint(1, self.M)
        elif tasksetType == 'light':
            h = random.randint(1, math.ceil(0.3 * self.M))
        elif tasksetType == 'heavy':
            h = random.randint(math.ceil(0.3 * self.M), self.M)
        else:
            raise ValueError, 'Unexpected taskset type: %s' % (tasksetType)

        # Calculate utilization: U_i
        v = float(L) * h / T

        if v > remUtil:
            L = remUtil * T / h
            v = float(L) * h / T
            stop = True

        # Generate resource demand factor based on random distribution
        r = random.randint(1, 100)

        # Create the task object with the selected parameters
        task = Task(tid, L, T, h, r)
        remUtil -= v

        return task, remUtil, stop

    def print_taskset(self, taskset):
        tidx = 1
        for u in taskset:
            print '=' * 100
            v = 0
            print
            for p in taskset[u]:
                print '*' * 57
                for t in taskset[u][p]:
                    v += (t.c * t.h / float(p))
                    print t, " | v = %1.3f" % (v)

        return
