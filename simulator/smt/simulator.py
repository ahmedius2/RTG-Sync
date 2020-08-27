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

    print
    for tsIdx in range(NUM_OF_TEST_TASKSETS):
        # Generate taskset and then create SMT script
        taskFactory = Generator(NUM_OF_CORES, range(1, NUM_OF_CORES + 1),
                EDGE_PROBABILITY, MAX_TASKS_PER_PERIOD, SEED)

        taskset = taskFactory.create_taskset('mixed')
        tasksets['Real'].append(taskset)

        virtual_taskset = {}
        for util in taskset:
            vg_idx = 0
            virtual_taskset[util] = {}

            for period, candidate_set in taskset[util].items():
                vgc_params = {
                    'stop_interval'     : 50,
                    'utilization'       : util,
                    'taskset_index'     : tsIdx,
                    'time'              : False,
                    'period'            : period,
                    'num_of_cores'      : NUM_OF_CORES,
                    'candidate_set'     : candidate_set,
                    'tasks_per_period'  : MAX_TASKS_PER_PERIOD
                }

                vgc_factory = VirtualGangCreator(vgc_params)
                virtual_taskset[util][period] = vgc_factory.run(vg_idx)
                vg_idx = virtual_taskset[util][period][-1].tid
                print_progress(tsIdx + 1, NUM_OF_TEST_TASKSETS, util,
                        NUM_OF_CORES, period)

        tasksets['Virtual'].append(virtual_taskset)

    print '\n'
    dbg_dump_vgang_info(tasksets)

    return

def dbg_dump_vgang_info(tasksets):
    rem_result_file()
    for tsIdx in range(NUM_OF_TEST_TASKSETS):
        with open(RESULT_FILE, 'a') as fdo:
            for nature in tasksets:
                print_taskset(fdo, tasksets[nature][tsIdx], nature, tsIdx)

            fdo.write('\n')

    return

def print_taskset(fdo, taskset, nature, tsIdx):
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

def print_progress(cur_taskset, max_tasksets, cur_util, max_util, period):
    print '[PROGRESS] Processing Taskset: %4d / %-4d | Utilization: %2d '   \
            '/ %-2d | Period: %d\r' % (cur_taskset, max_tasksets, cur_util, \
                    max_util, period),

    sys.stdout.flush()

    return

def rem_result_file():
    if os.path.exists(RESULT_FILE):
        os.remove(RESULT_FILE)

    return

if __name__ == '__main__':
    main()
