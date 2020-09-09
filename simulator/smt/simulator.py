#!/usr/bin/env python

import os, sys, shutil
import multiprocessing
from rtaFactory import RTA
from parserFactory import Aggregator
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

from taskFactory import Task

import matplotlib
matplotlib.use('Agg')

import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt

PRISTINE = False
NUM_OF_CORES = 16
HEURISTICS = True
EDGE_PROBABILITY = 30

TASKSET_TYPE = sys.argv[1]

MAX_TASKS_PER_PERIOD = 50
RESULT_FILE = 'vgangs.txt'
NUM_OF_TEST_TASKSETS = int(sys.argv[2])
UTILIZATIONS = range(1, NUM_OF_CORES + 1)
PARALLELISM = multiprocessing.cpu_count()

# Debug single candidate-set. The candidate-set must be present in the
# generated directory
DEBUG = False
DEBUG_SEED = {
    'util'      :   2,
    'period'    :   15,
    'tsIdx'     :   268
}

CANDIDATE_SET = 'ts345_u6_p660'

def unit_test_heuristic_prec_const():
    '''
      Taskset: t1, t2, t3, t4
      Precedence: t1 -> t2 ; t3 -> t4
      PQ: 1, 4, 3, 2

      Wrong VGang: 1 + 4, 2 + 3
      Right VGang: 1 + 4, 2, 3
    '''
    taskset = {500: {'Real': []}}
    taskset[500]['Real'] = [Task(1, 100, 500, 1, 1, [2]),
                            Task(2, 80,  500, 1, 1),
                            Task(3, 70,  500, 1, 1, [4]),
                            Task(4, 90,  500, 1, 1)]

    rta_params = {
            'num_of_cores': NUM_OF_CORES
    }

    rta = RTA(rta_params)
    scheulable = rta.run(taskset, 'h1-len-dsc', False)
    sys.exit()

    return

# unit_test_heuristic_prec_const()

def main():
    assert not (PRISTINE and HEURISTICS), ("Heuristic study cannot be "
            "conducted under pristine build and vice-versa")

    if DEBUG: dbg_single_candidate_set()
    if PRISTINE: parallel_create_virtual_taskset(); sys.exit(1)

    if not HEURISTICS:
        # Aggregate results by parsing the file-system logs and re-create real
        # and virtual tasksets for further processing
        aggregator = Aggregator()
        tasksets = aggregator.run()
    else:
        tasksets = {}

        for tsIdx in range(NUM_OF_TEST_TASKSETS):
            tf_params = {
                'seed'              : tsIdx + 1,
                'num_of_cores'      : NUM_OF_CORES,
                'utils'             : UTILIZATIONS,
                'edge_prob'         : EDGE_PROBABILITY,
                'tasks_per_period'  : MAX_TASKS_PER_PERIOD
            }

            taskFactory = Generator(tf_params)
            tasksets[tsIdx] = taskFactory.create_taskset(TASKSET_TYPE)

        tasksets = convert_taskset(tasksets)

    rta_params = {
            'num_of_cores': NUM_OF_CORES
    }

    rta = RTA(rta_params)

    rtgsync = ['h1-len-dsc'] #, 'h2-lnr-hyb']
    schedulers = rtgsync

    color_scheme = {
        'RT-Gang': 'magenta',
        'RTG-Sync': 'green',
        'RTG-Sync-H1': 'cyan',
        'RTG-Sync-H2a': 'blue',
        'RTG-Sync-H2b': 'purple',
        'RTG-Sync-H3a': 'orange',
        'RTG-Sync-H3b': 'red',
        'RTG-Sync-Hx' : 'brown'
    }

    sched_names = {
        'RT-Gang'       : 'RT-Gang',
        'RTG-Sync'      : 'RTG-Sync',
        'RTG-Sync-H1'   : 'h1-len-dsc',
        'RTG-Sync-H2a'  : 'h2-par-asc',
        'RTG-Sync-H2b'  : 'h3-par-dsc',
        'RTG-Sync-H3a'  : 'h4-cst-asc',
        'RTG-Sync-H3b'  : 'h5-cst-dsc',
        'RTG-Sync-Hx'   : 'h6-wln-dsc'
    }

    sched_markers = {
        'RT-Gang'       : 'o',
        'RTG-Sync'      : '*',
        'RTG-Sync-H1'   : '^',
        'RTG-Sync-H2a'  : '8',
        'RTG-Sync-H2b'  : 's',
        'RTG-Sync-H3a'  : 'd',
        'RTG-Sync-H3b'  : 'p',
        'RTG-Sync-Hx'   : 'x'
    }

    sched_ratio = {s: {} for s in schedulers}

    for tsIdx in tasksets:
        u_tasksets = tasksets[tsIdx]

        for u, ts in u_tasksets.items():
            for s in schedulers:
                if not sched_ratio[s].has_key(u):
                    sched_ratio[s][u] = 0

                sched_ratio[s][u] += rta.run(ts, s, False)

    # for s in sched_ratio:
    #     print '%15s:' % (s), sched_ratio[s]

    # create_sched_plots(sched_ratio, schedulers, color_scheme, sched_names, sched_markers, 'bar')
    # create_sched_plots(sched_ratio, schedulers, color_scheme, sched_names, sched_markers, 'line')

    return

def convert_taskset(tasksets):
    conv_tasksets = {}

    for tsIdx in tasksets:
        conv_tasksets[tsIdx] = {}

        for u in tasksets[tsIdx]:
            conv_tasksets[tsIdx][u] = {}

            for p in tasksets[tsIdx][u]:
                conv_tasksets[tsIdx][u][p] = {'Real': tasksets[tsIdx][u][p]}

    return conv_tasksets

def stratify_data(data, idx, wd):
    x = [v + (idx * wd) for v in sorted(data.keys())]
    y = [data[v] for v in sorted(data.keys())]

    return x, y

def create_sched_plots(sched_hash, sched_list, clist, snames, smarks, plot_type = 'bar'):
    fig = plt.subplots(1, 1, figsize = (10, 8))

    idx = -3
    wd = 0.1 if plot_type == 'bar' else 0.0

    for s in sched_list:
        x, y = stratify_data(sched_hash[s], idx, wd)
        idx += 1

        if plot_type == 'bar':
            plt.bar(x, y, color = clist[s], width = wd, lw = 1.0, label = snames[s])
            continue

        plt.plot(x, y, lw = 1.5, color = clist[s], label = snames[s], marker = smarks[s])

    plt.xlim([0.5, 16.5])
    plt.ylim([0, NUM_OF_TEST_TASKSETS * 1.05])
    plt.xlabel('Utilizations', fontsize = 'x-large', fontweight = 'bold')
    plt.ylabel('Schedulable Tasksets', fontsize = 'x-large', fontweight = 'bold')
    plt.title(TASKSET_TYPE.capitalize(), fontsize = 'xx-large', fontweight = 'bold')
    plt.legend(fontsize = 'x-large')

    plt.savefig('sched_%s_%s.pdf' % (TASKSET_TYPE, plot_type), bbox_inches = 'tight')

    return

def dbg_single_candidate_set():
    taskset_dir = 'generated/' + CANDIDATE_SET
    assert os.path.exists(taskset_dir), ("Taskset directory <%s> "
            "does not exist in the generated folder" % (taskset_dir))

    print "[DEBUG] Starting debug session...\n"

    if DEBUG_SEED:
        period = DEBUG_SEED['period']
        tsIdx = DEBUG_SEED['tsIdx']
        util = DEBUG_SEED['util']
        seed =  tsIdx + 1

        taskFactory = Generator(NUM_OF_CORES, UTILIZATIONS, EDGE_PROBABILITY,
                seed, MAX_TASKS_PER_PERIOD)
        taskset = taskFactory.create_taskset('mixed')
        candidate_set = taskset[util][period]
    else:
        parser = Aggregator()
        candidate_set = parser.parse_taskset(CANDIDATE_SET, 'real')
        tsIdx, util, period = parser.parse_taskset_dir(CANDIDATE_SET)

    banner = "\t" + "-" * 16 + " Candidate Set " + "-" * 18 + "\n"
    print_single_candidate_set(sys.stdout, candidate_set, banner)

    vgc_params = {
        'stop_interval'     : 1,
        'timeout'           : 2,
        'max_timeout'       : 30,
        'debug'             : True,
        'verify'            : True,
        'utilization'       : util,
        'taskset_index'     : tsIdx,
        'period'            : period,
        'num_of_cores'      : NUM_OF_CORES,
        'candidate_set'     : candidate_set,
        'tasks_per_period'  : MAX_TASKS_PER_PERIOD
    }

    vgc = VirtualGangCreator(vgc_params)
    virtual_taskset = vgc.run(1)

    print "\n[DEBUG] Debug session ended!"
    sys.exit(1)

    return

def parallel_create_virtual_taskset():
    processes = {}

    # Remove generated directory for pristine execution
    # generated_dir = os.getcwd() + '/generated'
    # if os.path.exists(generated_dir): shutil.rmtree(generated_dir)

    print
    for r in range(1000, NUM_OF_TEST_TASKSETS, PARALLELISM):
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

    taskset = taskFactory.create_taskset('light')

    virtual_taskset = {}
    for util in taskset:
        vg_idx = 0
        virtual_taskset[util] = {}

        for period, candidate_set in taskset[util].items():
            vgc_params = {
                'stop_interval'     : 1,
                'timeout'           : 2,
                'max_timeout'       : 30,
                'utilization'       : util,
                'taskset_index'     : tsIdx,
                'verify'            : True,
                'debug'             : False,
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

def print_taskset(fdo, taskset, tsIdx, debug = False):
    fdo.write("Taskset # %d\n" % (tsIdx))

    for u in taskset:
        fdo.write("  Utilization=%d\n" % (u))

        for T in taskset[u]:
            fdo.write("    Period=%d\n" % (T))

            if not debug:
                for nature in taskset[u][T]:
                    fdo.write("\n      " + "-" * 20 + nature + "-" * 20 + "\n")
                    print_single_candidate_set(fdo, taskset[u][T][nature])
            else:
                print_single_candidate_set(fdo, taskset[u][T])

            fdo.write("\n" + "=" * 50 + '\n\n')

    return

def print_single_candidate_set(fdo, candidate_set, banner = ''):
    if banner != '': print banner,

    for t in candidate_set:
        fdo.write("      " + t.__str__() + '\n')

    return

def dbg_dump_vgang_info(tasksets):
    if os.path.exists(RESULT_FILE): os.remove(RESULT_FILE)

    for tsIdx in tasksets:
        with open(RESULT_FILE, 'a') as fdo:
            print_taskset(fdo, tasksets[tsIdx], tsIdx)

            fdo.write('\n')

    return

def print_progress(cur_taskset, max_tasksets, cur_util, max_util, period):
    print '[PROGRESS] Processing Taskset: %4d / %-4d | Utilization: %2d '    \
            '/ %-2d | Period: %4d\r' % (cur_taskset, max_tasksets, cur_util, \
                    max_util, period),

    sys.stdout.flush()

    return

if __name__ == '__main__':
    main()
