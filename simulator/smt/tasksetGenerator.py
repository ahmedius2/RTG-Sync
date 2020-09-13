import sys
import math, random
from time import time
from taskFactory import Task

class Generator:
    def __init__ (self, params):
        required_params = ['edge_prob', 'num_of_cores', 'utils', 'seed',
                'demand_type']

        default_optional_params = {
            'tasks_per_period'  : None,
            'length_interval'   : (10, 5),
            'demand_interval'   : (1, 100),
            'period_interval'   : (10, 1500)
        }

        for req_param in required_params:
            assert params.has_key(req_param), ("<%s> is a required parameter "
                    "for taskset Generator class" % (req_param))

            setattr(self, req_param, params[req_param])

        for opt_param in default_optional_params:
            if opt_param in params:
                setattr(self, opt_param, params[opt_param])
                continue

            setattr(self, opt_param, default_optional_params[opt_param])

        assert self.num_of_cores >= 4, ("Taskset generator assumes that "
                "there are at-least 4 cores available on the platform. "
                "Given core count = %d" % (self.num_of_cores))

        assert self.seed > 0, ("Seed value <%s> should be greater than "
                "0." % self.seed)

        # Initialize the random number generator with the provided seed
        random.seed(time()) # self.seed)

        return

    def create_taskset(self, tasksetType):
        taskset = {}

        for u in self.utils:
            tid = 1
            remUtil = u
            taskset[u] = {}

            while remUtil > 0.01:
                # Pick period: T_i
                T = random.randint(*self.period_interval)

                # T_i must be unique; otherwise our candidate-set for T will
                # end up having more tasks than tasks_per_period
                if T in taskset[u]:
                    continue

                taskset[u][T] = []

                # Randomly select the number of tasks to generate for the
                # current period
                if not self.tasks_per_period:
                    self.tasks_per_period = random.randint(4,
                            self.num_of_cores)

                while (tid % self.tasks_per_period):
                    task, remUtil, stop = self.gen_task_params(tasksetType,
                            remUtil, T, tid)

                    if self.__verify_task(task):
                        taskset[u][T].append(task)
                        tid += 1

                    if stop: break
                else:
                    # Generate tpp-th task
                    task, remUtil, stop = self.gen_task_params(tasksetType,
                            remUtil, T, tid)

                    if self.__verify_task(task):
                        taskset[u][T].append(task)
                        tid += 1

                # We did not generate any tasks for this util / period combo
                if taskset[u][T] == []:
                    del taskset[u][T]

        # Add edges to make the taskset a DAG
        self.add_edges(taskset)

        return taskset

    def __verify_task(self, task):
        if task and task.c > 0:
            return True

        return False

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
                    this_task_edge_prob = self.edge_prob / \
                            ((last_task_tid - t.tid + 1) / 2.0)

                    for tnext in range(t.tid + 1, last_task_tid + 1):
                        p = random.randint(1, 100)
                        if p <= this_task_edge_prob: edge_list.append(tnext)

                    t.add_edges(edge_list)

        return

    def gen_task_params(self, tasksetType, remUtil, T, tid):
        stop = False

        if remUtil < 0.01:
            return None, remUtil, True

        # Pick length: L_i
        L = random.randint(T/self.length_interval[0],
                T/self.length_interval[1])

        # Pick height based on taskset type
        if tasksetType == 'mixed':
            h = random.randint(1, self.num_of_cores)
        elif tasksetType == 'light':
            h = random.randint(1, math.ceil(0.3 * self.num_of_cores))
        elif tasksetType == 'heavy':
            h = random.randint(math.ceil(0.3 * self.num_of_cores),
                    self.num_of_cores)
        else:
            raise ValueError, 'Unexpected taskset type: %s' % (tasksetType)

        # Calculate utilization: U_i
        v = float(L) * h / T

        if v > remUtil:
            L = remUtil * T / h
            v = float(L) * h / T
            stop = True

        # Generate resource demand factor based on random distribution
        if self.demand_type != '0':
            r = random.randint(*self.demand_interval)
        else:
            r = 1

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
