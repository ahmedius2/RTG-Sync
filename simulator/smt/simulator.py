#!/usr/bin/env python

import os, sys, shutil
import multiprocessing
from parserFactory import Aggregator
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

SEED = 5
PRISTINE = False
NUM_OF_CORES = 8
EDGE_PROBABILITY = 25
MAX_TASKS_PER_PERIOD = 8
NUM_OF_TEST_TASKSETS = 10
UTILIZATIONS = range(1, NUM_OF_CORES)
RESULT_FILE = 's%d_vgangs.txt' % (SEED)
PARALLELISM = multiprocessing.cpu_count()

def main():
    if PRISTINE: parallel_create_virtual_taskset()

    # Aggregate results by parsing the file-system logs and re-create real and
    # virtual tasksets for further processing
    aggregator = Aggregator()
    tasksets = aggregator.run()
    dbg_dump_vgang_info(tasksets)

    return

def parallel_create_virtual_taskset():
    processes = {}

    # Remove generated directory for pristine execution
    generated_dir = os.getcwd() + '/generated'
    if os.path.exists(generated_dir): shutil.rmtree(generated_dir)

    print
    for r in range(0, NUM_OF_TEST_TASKSETS, PARALLELISM):
        for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
            processes[tsIdx] = multiprocessing.Process(target = \
                    virtual_gang_generator_thread_entry, args = (tsIdx,))

            processes[tsIdx].start()

        for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
            processes[tsIdx].join()

    print '\n'

    return

def virtual_gang_generator_thread_entry(tsIdx):
    # Generate taskset and then create SMT script
    taskFactory = Generator(NUM_OF_CORES, UTILIZATIONS, EDGE_PROBABILITY,
            tsIdx + 1, MAX_TASKS_PER_PERIOD)

    taskset = taskFactory.create_taskset('mixed')

    virtual_taskset = {}
    for util in taskset:
        vg_idx = 0
        virtual_taskset[util] = {}

        for period, candidate_set in taskset[util].items():
            vgc_params = {
                'stop_interval'     : 1,
                'utilization'       : util,
                'taskset_index'     : tsIdx,
                'verify'            : True,
                'period'            : period,
                'num_of_cores'      : NUM_OF_CORES,
                'candidate_set'     : candidate_set,
                'tasks_per_period'  : MAX_TASKS_PER_PERIOD
            }

            print_progress(tsIdx + 1, NUM_OF_TEST_TASKSETS, util,
                    NUM_OF_CORES, period)

            vgc_factory = VirtualGangCreator(vgc_params)
            virtual_taskset[util][period] = vgc_factory.run(vg_idx)

            try:
                vg_idx = virtual_taskset[util][period][-1].tid
            except:
                raise ValueError, ("Virtual taskset does not exist for: "
                        "tsIdx=%d util=%d period=%d" % (tsIdx, util, period))

    return

def print_taskset(fdo, taskset, tsIdx):
    fdo.write("Taskset # %d\n" % (tsIdx))

    for u in taskset:
        fdo.write("  Utilization=%d\n" % (u))

        for T in taskset[u]:
            fdo.write("    Period=%d\n" % (T))

            for nature in taskset[u][T]:
                fdo.write("\n      " + "-" * 20 + nature + "-" * 20 + "\n")

                for t in taskset[u][T][nature]:
                    fdo.write("      " + t.__str__() + '\n')

            fdo.write("\n" + "=" * 50 + '\n\n')

    return

def dbg_dump_vgang_info(tasksets):
    if os.path.exists(RESULT_FILE): os.remove(RESULT_FILE)

    for tsIdx in tasksets:
        with open(RESULT_FILE, 'a') as fdo:
            print_taskset(fdo, tasksets[tsIdx], tsIdx)

            fdo.write('\n')

    return

def print_progress(cur_taskset, max_tasksets, cur_util, max_util, period):
    print '[PROGRESS] Processing Taskset: %4d / %-4d | Utilization: %2d '   \
            '/ %-2d | Period: %4d\r' % (cur_taskset, max_tasksets, cur_util, \
                    max_util, period),

    sys.stdout.flush()

    return

if __name__ == '__main__':
    main()
