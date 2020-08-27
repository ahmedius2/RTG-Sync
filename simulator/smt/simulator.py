#!/usr/bin/env python

import os, sys
from taskFactory import Task
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

SEED = 5
NUM_OF_CORES = 8
EDGE_PROBABILITY = 50
MAX_TASKS_PER_PERIOD = 8
NUM_OF_TEST_TASKSETS = 100
RESULT_FILE = 's%d_vgangs.txt' % (SEED)

def main():
    tasksets = {'Real': [], 'Virtual': []}

    for tsIdx in range(NUM_OF_TEST_TASKSETS):
        # Generate taskset and then create SMT script
        taskFactory = Generator(NUM_OF_CORES, [NUM_OF_CORES], EDGE_PROBABILITY,
                MAX_TASKS_PER_PERIOD, SEED)

        taskset = taskFactory.create_taskset('mixed')
        tasksets['Real'].append(taskset)

        vg_idx = 0
        virtual_taskset = {}
        for util in taskset:
            virtual_taskset[util] = {}

            for period, candidate_set in taskset[util].items():
                vgc_params = {
                    'stop_interval'     : 100,
                    'debug'             : False,
                    'time'              : False,
                    'period'            : period,
                    'num_of_cores'      : NUM_OF_CORES,
                    'candidate_set'     : candidate_set,
                    'tasks_per_period'  : MAX_TASKS_PER_PERIOD
                }

                vgc_factory = VirtualGangCreator(vgc_params)
                virtual_taskset[util][period] = vgc_factory.run(vg_idx)
                vg_idx = virtual_taskset[util][period][-1].tid
        tasksets['Virtual'].append(virtual_taskset)

        print '[PROGRESS] Virtual Gangs Formed: %4d / %-4d\r' % (tsIdx + 1,
                NUM_OF_TEST_TASKSETS),
        sys.stdout.flush()

    print

    rem_result_file()
    for tsIdx in range(NUM_OF_TEST_TASKSETS):
        with open(RESULT_FILE, 'a') as fdo:
            for nature in tasksets:
                dbg_print_taskset(fdo, tasksets[nature][tsIdx], nature, tsIdx)

            fdo.write('\n')

    return

def rem_result_file():
    if os.path.exists(RESULT_FILE):
        os.remove(RESULT_FILE)

    return

def dbg_print_taskset(fdo, taskset, nature, tsIdx):
    fdo.write( "\n================ %7s Taskset # %-4d ===============\n" %
            (nature, tsIdx))
    for u in taskset:
        fdo.write( "Utilization=%d\n" % (u))

        for T in taskset[u]:
            fdo.write( "  Period=%d\n" % (T))

            for t in taskset[u][T]:
                fdo.write( "    " + t.__str__() + '\n')

            fdo.write( "-" * 25 + '\n')

    return

if __name__ == '__main__':
    main()
