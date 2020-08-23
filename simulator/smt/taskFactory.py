'''
Task Generator

The purpose of this class is to generate task objects and populate their
parameters randomly (within preset limits) as per our task model.

Copyright (C) 2019 KU-CSL
09-07-2019  Define task generator class
'''

from time import time
import random

EDGE_PROBABILITY = 50

class Task:
    def __init__ (self, taskId, c, p, h, r, e = -1):
        '''
        Initialize a task object. The task object is defined by the
        following parameters:

            Compute Time (c):     Execution time of the task in isolation.
                                  This is determined randomly; ranging from 1
                                  to the maximum allowed compute time value.

            Period (p):           Period of the task.

            Number of Cores (h):  Maximum degree of parallelization of the
                                  task. This value specifies the number of
                                  cores required to execute the task. It
                                  ranges from 1 to 'M' where M is the total
                                  number of cores in the system.

            Resource Demand (r):  Percentage of a critical (bottleneck)
                                  resource needed by the task
        '''
        self.tid = taskId
        self.c = int(c)
        self.p = int(p)
        self.h = int(h)
        self.r = int(r)

        # Assume that there is an edge from tid to tid + 1 if self.e is 1
        if e == -1:
            random.seed(time())
            p = random.randint(1, 100)
            self.e = 1 if p <= EDGE_PROBABILITY else 0
        else:
            if e not in [0, 1]:
                raise ValueError, "Invalid value: e=%d" % (e)

            self.e = e

        return

    def copy (self):
        return Task (self.tid, self.c, self.p, self.h, self.r, self.e)

    def __str__ (self):
        u = self.c * self.h / float(self.p)
        return 'Task: %2d | C=%4d P=%4d h=%2d r=%2d e=%1d u=%6s' % (self.tid,
                self.c, self.p, self.h, self.r, self.e, '{:2.3f}'.format (u))
