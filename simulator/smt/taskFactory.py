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
    def __init__(self, taskId, c, p, h, r, e = []):
        '''
        Initialize a task object. The task object is defined by the following
        parameters:

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
        self.e = e

        return

    def add_edges(self, e):
        self.e = e
        return

    def copy(self):
        return Task (self.tid, self.c, self.p, self.h, self.r, self.e)

    def __str__(self):
        u = self.c * self.h / float(self.p)
        edges = 'None' if not self.e else \
                ','.join(['t%d->t%d' % (self.tid, t) for t in self.e])
        return 'Task: %2d | C=%4d P=%4d h=%2d r=%2d u=%6s e=%s' % (self.tid,
                self.c, self.p, self.h, self.r, '{:2.3f}'.format (u), edges)
