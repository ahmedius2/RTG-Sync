#!/usr/bin/env python

from taskFactory import Task
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

DEBUG = False
NUM_OF_CORES = 8
EDGE_PROBABILITY = 50
MAX_TASKS_PER_PERIOD = 8

def main():
    optimal_solution = None

    if DEBUG == 1:
        # Generate SMT script for sample taskset
        period = 100
        candidate_set = [Task(1,  30, period, 3, 30),
                         Task(2,  20, period, 2, 50),
                         Task(3,  40, period, 2, 70)]
    elif DEBUG == 2:
        period = 248
        candidate_set = [Task(1,  29, period, 3, 10),
                         Task(2,  37, period, 2, 47),
                         Task(3,  27, period, 1, 57),
                         Task(4,  34, period, 4, 31)]
    elif DEBUG == 3:
        period = 1233
        candidate_set = [Task(1, 206, period, 2,  9),
                         Task(2, 220, period, 2, 17),
                         Task(3, 172, period, 1, 89),
                         Task(4, 161, period, 1, 78),
                         Task(5, 159, period, 3, 95),
                         Task(6, 135, period, 3,  5),
                         Task(7, 143, period, 2, 76),
                         Task(8, 221, period, 1, 90)]
    else:
        # Generate taskset and then create SMT script
        taskFactory = Generator(NUM_OF_CORES, [NUM_OF_CORES], EDGE_PROBABILITY,
                MAX_TASKS_PER_PERIOD)

        taskset = taskFactory.create_taskset('light')
        candidate_set, period = test_candidate_set(taskset[NUM_OF_CORES], True)

    vgc_params = {
        'debug'             : True,
        'time'              : True,
        'period'            : period,
        'num_of_cores'      : NUM_OF_CORES,
        'candidate_set'     : candidate_set,
        'tasks_per_period'  : MAX_TASKS_PER_PERIOD
    }

    vgc_factory = VirtualGangCreator(vgc_params)
    virtual_taskset = vgc_factory.run(0)
    dbg_print_taskset({period: virtual_taskset})

    return

def dbg_print_taskset(taskset):
    print "\n================ DEBUG ==============="
    for T in taskset:
        print "Period=%d" % (T)
        for t in taskset[T]:
            print "  ", t
        print "-" * 25

    return

def test_candidate_set(taskset, debug = False):
    # Select just one task-list in taskset with "TPP" tasks in it
    candidate_set = None
    period = 0

    for T in taskset:
        if len(taskset[T]) == MAX_TASKS_PER_PERIOD:
            candidate_set = taskset[T]
            period = T
            break

    if not candidate_set:
        dbg_print_taskset(taskset)
        raise ValueError, "Candidate set cannot be empty!"

    return candidate_set, period

if __name__ == '__main__':
    main()
