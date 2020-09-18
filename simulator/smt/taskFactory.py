'''
Task Generator

The purpose of this class is to generate task objects and populate their
parameters randomly (within preset limits) as per our task model.

Copyright (C) 2019 KU-CSL
09-07-2019  Define task generator class
'''

from time import time
import random

class Task:
    def __init__(self, taskId, c, p, h, r, e = [], members = ''):
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
        self.c = c
        self.e = e
        self.p = int(p)
        self.h = int(h)
        self.r = int(r)
        self.tid = taskId
        self.members = members
        self.name = 't%d' % taskId

        return

    def add_edges(self, e):
        self.e = e
        return

    def copy(self):
        '''
          Perform a "deep" copy of this task.
        '''

        # List and dictionaries are passed by reference in python. We must
        # copy each member of the list separately so that we may not end-up
        # modifying the original reference in the copied object
        copied_edge_list = [edge for edge in self.e]

        return Task (self.tid, self.c, self.p, self.h, self.r,
                copied_edge_list, self.members)

    def __str__(self):
        u = self.c * self.h / float(self.p)

        task_string = 'Task: %2d | C=%6s P=%4d h=%2d r=%3d u=%6s' %  \
                (self.tid, '{:3.2f}'.format(self.c), self.p, self.h, \
                 self.r, '{:2.3f}'.format (u))

        edges = ' e=' + ','.join(['t%d->t%d' % (self.tid, t) for t in self.e]) \
                if self.e != [] else ''

        members = ' m=' + self.members if self.members != '' else ''

        return task_string + edges + members
