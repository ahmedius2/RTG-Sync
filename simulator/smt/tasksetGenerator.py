import math, random
from time import time
from taskFactory import Task

class Generator:
    def __init__ (self, numOfCores, utils, max_edge_probability,
            seed, tasks_per_period = False):

        self.mep = max_edge_probability
        self.tpp = tasks_per_period
        self.M = numOfCores
        self.U = utils

        assert self.M >= 4, ("Taskset generator assumes that there are "
                             "at-least 4 cores available on the platform. "
                             "Given core count = %d" % (self.M))

        assert seed > 0, ("Seed value <%s> should be greater than 0.", seed)

        # Initialize the random number generator with a specific seed
        random.seed(seed)

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
                if not self.tpp: self.tpp = random.randint(4, self.M)

                while (tid % self.tpp):
                    task, remUtil, stop = self.gen_task_params(tasksetType, remUtil, T, tid)
                    taskset[u][T].append(task)
                    tid += 1
                    if stop: break
                else:
                    task, remUtil, stop = self.gen_task_params(tasksetType, remUtil, T, tid)
                    taskset[u][T].append(task)
                    tid += 1

        self.add_edges(taskset)

        return taskset

    def add_edges(self, taskset):
        '''
          Edge Generation Algorithm
            - Assume strict order b/w tasks and only 'forward' edges; to avoid
              creation of cycles by design
            - Each task can have edge with any task that comes after it; based
              on a coin toss probability scheme
        '''
        for u in taskset:
            for T in taskset[u]:
                candidate_set = taskset[u][T]
                last_task_tid = candidate_set[-1].tid

                for t in candidate_set:
                    edge_list = []
                    this_task_edge_prob = self.mep / \
                            ((last_task_tid - t.tid + 1) / 2.0)

                    for tnext in range(t.tid + 1, last_task_tid + 1):
                        p = random.randint(1, 100)
                        if p <= this_task_edge_prob: edge_list.append(tnext)

                    t.add_edges(edge_list)

        return

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
        task = Task(tid, int(L), T, h, r)
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
                    print "v = %1.3f | " % (v), t

        return
