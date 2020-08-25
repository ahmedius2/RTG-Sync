#!/usr/bin/env python

from taskFactory import Task
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

DEBUG = True
NUM_OF_CORES = 8
EDGE_PROBABILITY = 50
MAX_TASKS_PER_PERIOD = 8

def main():
    optimal_solution = None

    if DEBUG:
        period = 1233
        candidate_set = [Task(1, 206, period, 2,  9),
                         Task(2, 220, period, 2, 17),
                         Task(3, 172, period, 1, 89),
                         Task(4, 161, period, 1, 78),
                         Task(5, 159, period, 3, 95),
                         Task(6, 135, period, 3,  5),
                         Task(7, 143, period, 2, 76),
                         Task(8, 221, period, 1, 90)]

        taskset = {NUM_OF_CORES: {period: candidate_set}}
    else:
        # Generate taskset and then create SMT script
        taskFactory = Generator(NUM_OF_CORES, [NUM_OF_CORES], EDGE_PROBABILITY,
                MAX_TASKS_PER_PERIOD)

        taskset = taskFactory.create_taskset('mixed')

    # We now have our virtual taskset
    dbg_print_taskset(taskset, "Real")

    vg_idx = 0
    virtual_taskset = {}
    for util in taskset:
        virtual_taskset[util] = {}

        for period, candidate_set in taskset[util].items():
            vgc_params = {
                'debug'             : True,
                'time'              : True,
                'period'            : period,
                'num_of_cores'      : NUM_OF_CORES,
                'candidate_set'     : candidate_set,
                'tasks_per_period'  : MAX_TASKS_PER_PERIOD
            }

            vgc_factory = VirtualGangCreator(vgc_params)
            virtual_taskset[util][period] = vgc_factory.run(vg_idx)
            vg_idx = virtual_taskset[util][period][-1].tid

    # We now have our virtual taskset
    dbg_print_taskset(virtual_taskset, "Virtual")

    return

def dbg_print_taskset(taskset, nature):
    print "\n================ %7s Taskset ===============" % (nature)
    for u in taskset:
        print "Utilization=%d" % (u)

        for T in taskset[u]:
            print "  Period=%d" % (T)

            for t in taskset[u][T]:
                print "    ", t

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
