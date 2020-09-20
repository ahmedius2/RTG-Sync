#!/usr/bin/env python

import json, math
from time import time
import os, sys, shutil
import multiprocessing
from rtaFactory import RTA
from parserFactory import Aggregator
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

from taskFactory import Task
from heuristics import H2

import matplotlib
matplotlib.use('Agg')

import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt
from matplotlib.ticker import FormatStrFormatter

REUSE = True
PRISTINE = False
SMT_IDEAL = False
NUM_OF_CORES = 8
GFTP_DRYRUN = False
MAX_TASKS_PER_PERIOD = 8
RESULT_FILE = 'vgangs.txt'
UTILIZATIONS = range(1, NUM_OF_CORES)
PARALLELISM = multiprocessing.cpu_count()

def print_taskset(taskset):
    print 'Taskset:'
    for p in taskset:
        print '  - Period=%d' % (p)
        print '\n'.join(['    + %s' % (t) for t in taskset[p]])

    return

def print_progress_edge(cur_taskset, ep, util, period):
    print '[PROGRESS] Processing Taskset: %4d | EP: %2d | Util: %d | ' \
            'Period: %4d\r' % (cur_taskset, ep, util, period),

    sys.stdout.flush()

    return

def parallel_create_virtual_taskset_edge(ep):
    processes = {}
    NUM_OF_TEST_TASKSETS = 98

    for r in range(1, NUM_OF_TEST_TASKSETS, PARALLELISM):
        for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
            processes[tsIdx] = multiprocessing.Process(target = \
                    virtual_gang_generator_thread_entry_edge, args = (tsIdx,
                        ep))

            processes[tsIdx].start()

        for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
            processes[tsIdx].join()

    return

def virtual_gang_generator_thread_entry_edge(tsIdx, ep):
    NUM_OF_CORES = 8
    TASKSET_TYPE = 'light'
    MAX_TASKS_PER_PERIOD = 8
    NUM_OF_TEST_TASKSETS = 10

    # Generate taskset and then create SMT script
    tf_params = {
        'edge_prob'         : ep,
        'demand_type'       : 'r',
        'seed'              : tsIdx + 1,
        'num_of_cores'      : NUM_OF_CORES,
        'utils'             : UTILIZATIONS,
        'tasks_per_period'  : MAX_TASKS_PER_PERIOD
    }

    taskFactory = Generator(tf_params)
    taskset = taskFactory.create_taskset(TASKSET_TYPE)

    virtual_taskset = {}
    for util in taskset:
        vg_idx = 0
        virtual_taskset[util] = {}

        for period, candidate_set in taskset[util].items():
            gen_dir = '/edge_all_light/ep%d' % (ep)

            vgc_params = {
                'stop_interval'     : 1,
                'timeout'           : 2,
                'max_timeout'       : 30,
                'utilization'       : util,
                'taskset_index'     : tsIdx,
                'verify'            : True,
                'debug'             : False,
                'period'            : period,
                'gen_dir'           : gen_dir,
                'num_of_cores'      : NUM_OF_CORES,
                'candidate_set'     : candidate_set,
                'tasks_per_period'  : MAX_TASKS_PER_PERIOD
            }

            print_progress_edge(tsIdx + 1, ep, util, period)

            vgc_factory = VirtualGangCreator(vgc_params)
            virtual_taskset[util][period] = vgc_factory.run(vg_idx)

            try:
                vg_idx = virtual_taskset[util][period][-1].tid
            except:
                raise ValueError, ("Virtual taskset does not exist for: "
                        "tsIdx=%d util=%d period=%d" % (tsIdx, util, period))

    return

def edge_prob_experiment():
    '''
      Vary the edge probability param. and measure the impact on SMT solution
      and heuristic solution.

      U = [8], TPP = 8, EDGE_PROBABILITY = 0 -- 100
    '''
    tasksets = {}
    NUM_OF_CORES = 8
    schedulability = {}
    EDGE_PROBABILITY_RANGE = range(0, 101, 10)

    if PRISTINE:
        print '\n[PROGRESS] Collecting pristine data for SMT'
        for ep in EDGE_PROBABILITY_RANGE:
            parallel_create_virtual_taskset_edge(ep)

        print '\n[PROGRESS] Pristine data collection complete. Exiting!'
        sys.exit()

    print '\n[PROGRESS] Reading data from file-system'
    for ep in EDGE_PROBABILITY_RANGE:
        gen_dir = 'edge_all_light/ep%d/' % (ep)

        # Collect the results from the file-system
        aggregator = Aggregator(gen_dir)
        tasksets[ep] = aggregator.run(max_ts = 100)
    print

    rta_params = {
            'num_of_cores': NUM_OF_CORES
    }

    rta = RTA(rta_params)
    schedulers = ['RTG-Sync', 'h2-lnr-hyb', 'h6-crt-pth']

    for ep in EDGE_PROBABILITY_RANGE:
        schedulability[ep] = {}

        print '[PROGRESS] Conducting RTA | ep=%2d\r' % (ep),

        for tsIdx in tasksets[ep]:
            u_tasksets = tasksets[ep][tsIdx]

            for u, ts in u_tasksets.items():
                if u not in schedulability[ep]:
                    schedulability[ep][u] = {}

                for s in schedulers:
                    if s not in schedulability[ep][u]:
                        schedulability[ep][u][s] = 0

                    schedulability[ep][u][s] += rta.run(ts, s)

    print '\n'

    sched_file = 'edge_all_light/sched.json'
    with open(sched_file, 'w') as fdo:
        json.dump(schedulability, fdo)

    sys.exit()

    return

def read_sched_data_edge():
    sched_data = {}
    sched_file = 'edge_all_light/sched.json'

    assert os.path.exists(sched_file), ('File containing sched. data <%s> '
            'does not exist.' % (sched_file))

    with open(sched_file, 'r') as fdi:
        sched_dict = json.load(fdi)

    for ep in sched_dict:
        epi = int(ep)
        sched_data[epi] = {}

        for u in sched_dict[ep]:
            ui = int(u)
            sched_data[epi][ui] = {}

            for s in sched_dict[ep][u]:
                ss = str(s)
                sched_data[epi][ui][ss] = sched_dict[ep][u][s]

    return sched_data

def stratify_sched_data(data):
    plot_data = {}

    # Hardcode the parameters used in this experiment.
    # FIXME We should get these value from the json dataset for this experiment
    NUM_OF_CORES = 8
    NUM_OF_TASKSETS = 98
    UTILIZATIONS = range(1, NUM_OF_CORES + 1)

    # Assuming that we have 1 ... NUM_OF_CORES util. levels
    edge_probs = sorted(data.keys())

    plot_data['h2']  = []
    plot_data['smt'] = []
    plot_data['x'] = edge_probs

    max_sched_x_util = sum(UTILIZATIONS) * NUM_OF_TASKSETS

    for ep in edge_probs:
        sum_sched_x_util_smt = sum([data[ep][u]['RTG-Sync']   * u for u in data[ep]])
        sum_sched_x_util_h2  = sum([data[ep][u]['h2-lnr-hyb'] * u for u in data[ep]])

        plot_data['smt'].append(round(float(sum_sched_x_util_smt) / max_sched_x_util, 3))
        plot_data['h2'].append(round(float(sum_sched_x_util_h2) / max_sched_x_util, 3))

    return plot_data

def plot_edge_prob_data():
    sched_data = read_sched_data_edge()
    plot_data = stratify_sched_data(sched_data)

    fig, ax = plt.subplots(1, 1, figsize = (5, 4))
    plt.plot(plot_data['x'], plot_data['smt'], 'blue', lw = 1.0, ls = '-',
            marker = 'o', label = 'SMT')
    plt.plot(plot_data['x'], plot_data['h2'], 'green', lw = 1.0, ls = '-',
            marker = 's', label = 'Heuristic')

    plt.ylim([0.3, 0.5])
    ax.yaxis.set_major_formatter(FormatStrFormatter('%.2f'))
    plt.xlabel('Edge Probability (%)', fontsize = 'large', fontweight = 'bold')
    plt.ylabel('Weighted Utilization', fontsize = 'large',
            fontweight = 'bold')

    plt.legend(fontsize = 'medium')
    plt.savefig('final_plots/edge_probability.pdf', bbox_inches = 'tight',
            pad_inches = 0)

    return

edge_prob_experiment()
# plot_edge_prob_data()
# sys.exit()

def calc_time_avgs(time_data):
    avg_data = {}
    avg_data['x'] = sorted(time_data.keys())
    avg_data['smt'] = []
    avg_data['h2']  = []

    for tpp in avg_data['x']:
        total_smt_time = sum([time_data[tpp][tsIdx]['SMT'] for tsIdx in
            time_data[tpp].keys()])

        total_h2_time  = sum([time_data[tpp][tsIdx]['H2'] for tsIdx in
            time_data[tpp].keys()])

        avg_data['smt'].append(float(total_smt_time)/len(time_data[tpp].keys()))
        avg_data['h2'].append(float(total_h2_time)/len(time_data[tpp].keys()))

    return avg_data

def plot_timing_data(data):
    fig = plt.subplots(1, 1, figsize = (5, 4))

    bar_width = 0.25
    h2_xaxis  = [x - bar_width/2 for x in data['x']]
    smt_xaxis = [x + bar_width/2 for x in data['x']]

    plt.bar(smt_xaxis, data['smt'], color = 'orange', width = bar_width,
            lw = 1.0, edgecolor = 'black', label = 'SMT')

    plt.bar(h2_xaxis, data['h2'], color = 'green', width = bar_width,
            lw = 1.0, edgecolor = 'black', label = 'Heuristic')

    plt.grid(True, ls = '--')
    plt.yscale('log')
    plt.legend(fontsize = 'medium')
    plt.xlim([0, len(data['x']) + 1])
    plt.ylabel('Time (seconds)', fontsize = 'large', fontweight = 'bold')
    plt.xlabel('Tasks Per Period', fontsize = 'large', fontweight = 'bold')

    plt.savefig('plots_for_paper/smt_timing.pdf', bbox_inches = 'tight',
            pad_inches = 0)

    return

def smt_timing_experiment():
    '''
      Vary the tasks per period param. and measure the impact on SMT timing.

      U = [8], TPP = 5 -- 15 (or until SMT becomes too long)
    '''
    # Generate tasksets
    NUM_OF_CORES = 8
    EDGE_PROBABILITY = 25
    TASKSET_TYPE = 'light'
    NUM_OF_TEST_TASKSETS = 10
    MAX_TASKS_PER_PERIOD = 10
    UTILIZATIONS = [NUM_OF_CORES]

    init_tpp = 1
    init_tsIdx = 1
    reuse = True

    tasksets = {}
    time_taken = {}

    durations_file = "timing/durations.json"
    if os.path.exists(durations_file):
        with open(durations_file, 'r') as fdi:
            dictionary = json.load(fdi)

            for tpp in dictionary:
                time_taken[int(tpp)] = {}

                for tsIdx in dictionary[tpp]:
                    time_taken[int(tpp)][int(tsIdx)] = {}

                    for sched in dictionary[tpp][tsIdx]:
                        time_taken[int(tpp)][int(tsIdx)][str(sched)] = \
                                dictionary[tpp][tsIdx][sched]

        init_tpp = max(time_taken.keys())
        init_tsIdx = max(time_taken[init_tpp].keys())

    h2_params = {
        'num_of_cores': NUM_OF_CORES
    }

    h2 = H2(h2_params)

    print
    for tpp in range(1, MAX_TASKS_PER_PERIOD + 1):
        tasksets[tpp] = {}

        if tpp not in time_taken:
            time_taken[tpp] = {}

        for tsIdx in range(1, NUM_OF_TEST_TASKSETS + 1):
            if tsIdx in time_taken[tpp]:
                continue

            reuse = False
            tasksets[tpp][tsIdx] = {}
            time_taken[tpp][tsIdx] = {}

            tf_params = {
                'seed'              : tsIdx + 1,
                'demand_type'       : 'r',
                'num_of_cores'      : NUM_OF_CORES,
                'utils'             : UTILIZATIONS,
                'edge_prob'         : EDGE_PROBABILITY,
                'tasks_per_period'  : tpp
            }

            taskFactory = Generator(tf_params)
            taskset = taskFactory.create_taskset(TASKSET_TYPE)

            period = -1
            tpp_taskset = []

            for p in taskset[NUM_OF_CORES]:
                if len(taskset[NUM_OF_CORES][p]) == tpp:
                    tpp_taskset = taskset[NUM_OF_CORES][p]
                    period = p
                    break

            if period == -1:
                print "[ERROR] No taskset with tpp <%d> tasks: " % (tpp)
                print "  - Taskset:"
                for p in taskset:
                    '\n'.join(['    + %s' % (t) for t in taskset[p]])
                    print

                sys.exit()

            tasksets[tpp][tsIdx]['SMT'] = tpp_taskset

            # Solve SMT and measure time taken
            gen_dir = '/timing/tpp%d' % (tpp)
            vgc_params = {
                'stop_interval'     : 1,
                'timeout'           : 2,
                'tasks_per_period'  : tpp,
                'max_timeout'       : 999,
                'verify'            : True,
                'debug'             : False,
                'taskset_index'     : tsIdx,
                'period'            : period,
                'gen_dir'           : gen_dir,
                'candidate_set'     : tpp_taskset,
                'utilization'       : NUM_OF_CORES,
                'num_of_cores'      : NUM_OF_CORES
            }

            vgc = VirtualGangCreator(vgc_params)

            start = time()
            smt_virtual_taskset = vgc.run(1)
            time_taken[tpp][tsIdx]['SMT'] = time() - start

            start = time()
            result_dir = gen_dir + '/ts%d_u8_p%d' % (tsIdx, period)
            h2_virtual_taskset = h2.run(tpp_taskset, result_dir)
            time_taken[tpp][tsIdx]['H2'] = time() - start

            print '[PROGRESS] TPP: %2d | Taskset: %2d | SMT: %3.3f sec ' \
                    '| H2: %3.3f\r' % (tpp, tsIdx,
                            time_taken[tpp][tsIdx]['SMT'],
                            time_taken[tpp][tsIdx]['H2']),

            sys.stdout.flush()

            with open('timing/durations.json', 'w') as fdo:
                json.dump(time_taken, fdo)

            if time_taken[tpp][tsIdx]['SMT'] > 1800:
                print
                print "[xxxxxxxx] Time limit exceeded. Stopping experiment!"

                return

    if not reuse: print '\n',
    print '[PROGRESS] Plotting timing data...'
    if reuse: print "           + Reusing results"

    time_avgs = calc_time_avgs(time_taken)
    plot_timing_data(time_avgs)

    print '[PROGRESS] Done!'
    print

    # Exit normally
    return

# smt_timing_experiment()
# sys.exit()

def get_cli_params():
    demand_type = ''
    taskset_type = ''
    num_of_tasksets = 0
    edge_probability = 0

    if len(sys.argv) < 5:
        print 'usage: %s <TASKSET_TYPE> <NUM_OF_TASKSETS> <EDGE_PROB> ' \
                '<DEMAND_TYPE>' % (sys.argv[0])

        sys.exit()

    taskset_type = sys.argv[1]
    valid_taskset_types = ['light', 'mixed', 'heavy']

    if taskset_type not in valid_taskset_types:
        print '[ERROR] Invalid taskset type: <%s>' % (sys.argv[1])
        print '        - Allowed Values: %s' % ', '.join([t for t in
            valid_taskset_types])
        sys.exit()

    try:
        num_of_tasksets = int(sys.argv[2])
        valid_tasksets_range = range(1, 1001)

        if num_of_tasksets not in valid_tasksets_range:
            print '[ERROR] Invalid # of tasksets: <%d>' % (num_of_tasksets)
            print '        - Allowed Values: %s' % \
                    '%d ... %d' % (valid_taskset_range[0], valid_taskset_range[-1])

            sys.exit()
    except:
        raise ValueError, ('# of tasksets must be an integer value: <%s>' %
                (sys.argv[2]))

    try:
        edge_probability = int(sys.argv[3])
        valid_eprob_range = range(0, 100)

        if edge_probability not in valid_eprob_range:
            print '[ERROR] Invalid edge probability: <%d>' % (edge_probability)
            print '        - Allowed Values: %s' % \
                    '%d ... %d' % (valid_eprob_range[0], valid_eprob_range[-1])

            sys.exit()
    except:
        raise ValueError, ('Edge probability must be an integer value: <%s>' %
                (sys.argv[3]))

    demand_type = sys.argv[4]
    valid_demand_types = ['r', '0']

    if demand_type not in valid_demand_types:
        print '[ERROR] Invalid resource demand type: <%s>' % (sys.argv[4])
        print '        - Allowed Values: %s' % ', '.join([r for r in
            valid_demand_types])
        sys.exit()

    return taskset_type, num_of_tasksets, edge_probability, demand_type

TASKSET_TYPE, NUM_OF_TEST_TASKSETS, EDGE_PROBABILITY, DEMAND_TYPE = \
        get_cli_params()

DEBUG = False
# DEBUG_SEED = None
# DEBUG_SEED = {
#     'util'      :   2,
#     'period'    :   170,
#     'tsIdx'     :   7467
# }
# CANDIDATE_SET = 'ts7467_u2_p170'

def unit_test_rtg_rta():
    taskset = {491: {'Virtual': []}, 731: {'Virtual': []}}
    taskset[491]['Virtual'] = [Task(1,  62.00, 491, 6, 100),
                               Task(2,  49.00, 491, 6, 100),
                               Task(3, 114.95, 491, 8, 121),
                               Task(4,  81.00, 491, 8, 100),
                               Task(5,  53.00, 491, 4, 100),
                               Task(6,  75.00, 491, 8, 100)]

    taskset[731]['Virtual'] = [Task(7, 106.00, 731, 6, 63),
                               Task(8, 123.00, 731, 8, 88),
                               Task(9,  24.00, 731, 7, 12)]

    rta_params = {
        'num_of_cores': NUM_OF_CORES
    }

    rta = RTA(rta_params)
    schedulable = rta.run(taskset, 'RTG-Sync')
    print 'Taskset is %s' % ('schedulable' if schedulable == 1 else 'not schedulable')

    sys.exit()

    return

def merge_tasksets(tasksets, smti):
    for ts in tasksets:
        for u in tasksets[ts]:
            for p in tasksets[ts][u]:
                tasksets[ts][u][p]['RTG-Synci'] = smti[ts][u][p]['Virtual']

    return

def read_sched_data(sched_hash_file):
    sched_hash = {}

    with open(sched_hash_file, 'r') as fdo:
            sched_json = json.load(fdo)

    for s in sched_json:
        ss = str(s)
        sched_hash[ss] = {}

        for u in sched_json[s]:
            ui = int(u)
            sched_hash[ss][ui] = int(sched_json[s][u])

    return sched_hash

def stratify_data_final(data):
    x = [v for v in sorted(data.keys())] + [NUM_OF_CORES]
    y = [data[v] for v in sorted(data.keys())] + [0]

    return x, y

def create_sched_plots_final(sched_hash, sched_list, style):
    fig = plt.subplots(1, 1, figsize = (5, 4))

    for s in sched_list:
        x, y = stratify_data_final(sched_hash[s])
        plt.plot(x, y, lw = 1.0,
                color  = style[s]['c'],
                label  = style[s]['l'],
                marker = style[s]['m'],
                ls = '--' if s[-1] == 'i' else '-')

    plt.grid(True, ls = '--')
    plt.xlim([0.5, NUM_OF_CORES + 0.5])
    plt.ylim([0, NUM_OF_TEST_TASKSETS * 1.05])
    plt.xlabel('Utilizations', fontsize = 'x-large', fontweight = 'bold')
    plt.ylabel('Schedulable Tasksets', fontsize = 'x-large',
            fontweight = 'bold')

    if TASKSET_TYPE == 'mixed': plt.legend(fontsize = 'small',
            loc = 'lower left')

    plt.savefig('final_plots/%s_e%d_r%s.pdf' % (TASKSET_TYPE,
        EDGE_PROBABILITY, DEMAND_TYPE), bbox_inches = 'tight', pad_inches = 0)

    return

def main():
    # if DEBUG: dbg_single_candidate_set()
    if REUSE:
        sched_hash_file = 'plot_data/%s_e%d_r%s.json' % (TASKSET_TYPE,
                EDGE_PROBABILITY, DEMAND_TYPE)

        assert os.path.exists(sched_hash_file), ('Dictionary for sched. '
                'result not found here: <%s>' % (sched_hash_file))

        print '[PROGRESS] Resuing data:', sched_hash_file
        sched_hash = read_sched_data(sched_hash_file)

        style = {}
        style['RT-Gang']    = {'c': 'red',      'm': 'o',   'l': 'RT-Gang'}
        style['RTG-Sync']   = {'c': 'blue',     'm': '*',   'l': 'Virtual-Gang'}
        style['RTG-Synci']  = {'c': 'blue',     'm': '*',   'l': 'Virtual-Gang (Ideal)'}
        style['h2-lnr-hyb'] = {'c': 'green',    'm': '*',   'l': 'Virtual-Gang (Greedy)'}
        style['Threaded']   = {'c': 'cyan',     'm': 's',   'l': 'Threaded'}
        style['Threadedi']  = {'c': 'cyan',     'm': 's',   'l': 'Threaded (Ideal)'}
        style['GFTP']       = {'c': 'magenta',  'm': '^',   'l': 'Gang FTP'}
        style['GFTPi']      = {'c': 'magenta',  'm': '^',   'l': 'Gang FTP (Ideal)'}

        if EDGE_PROBABILITY != 0:
            schedulers = ['RTG-Sync', 'h2-lnr-hyb', 'RT-Gang']
            style['RTG-Sync']['l'] = 'Virtual-Gang (SMT)'
        else:
            schedulers = ['RTG-Synci', 'RTG-Sync', 'RT-Gang', 'Threadedi',
                    'Threaded', 'GFTPi', 'GFTP']

        create_sched_plots_final(sched_hash, schedulers, style)
        print '[PROGRESS] Plot done!'

        sys.exit()

    if PRISTINE: parallel_create_virtual_taskset(); sys.exit()

    # Aggregate results by parsing the file-system logs and re-create real and
    # virtual tasksets for further processing
    gen_dir = 'generated/%s_e%d_r%s' % (TASKSET_TYPE, EDGE_PROBABILITY,
            DEMAND_TYPE)

    aggregator = Aggregator(gen_dir)

    if not GFTP_DRYRUN:
        tasksets = aggregator.run((EDGE_PROBABILITY == 0))
    else:
        # For GFTP dry-run only
        tasksets = aggregator.run()

    if SMT_IDEAL:
        gen_dir = 'generated/%s_e%d_r0' % (TASKSET_TYPE, EDGE_PROBABILITY)
        aggregator = Aggregator(gen_dir)
        smti_tasksets = aggregator.run()

        merge_tasksets(tasksets, smti_tasksets)

    rta_params = {
            'num_of_cores': NUM_OF_CORES
    }

    rta = RTA(rta_params)


    if EDGE_PROBABILITY == 0:
        schedulers = ['RT-Gang', 'RTG-Sync', 'RTG-Synci', 'GFTP', 'GFTPi',
                'Threaded', 'Threadedi']
    else:
        schedulers = ['RT-Gang', 'RTG-Sync', 'h2-lnr-hyb']

    if GFTP_DRYRUN:
        if EDGE_PROBABILITY != 0:
            print '[ERROR] in GFTP dry run mode. EP must be 0!'
            sys.exit()

        # Only run GFTP rta in dry-run mode
        schedulers = ['GFTP']

    color_scheme = {
        'RT-Gang'       : 'red',        # 'magenta',
        'RTG-Sync'      : 'blue',       # 'green',
        'RTG-Synci'     : 'blue',       # 'green',
        'GFTP'          : 'magenta',    # 'cyan',
        'GFTPi'         : 'magenta',    # 'cyan',
        'h2-lnr-hyb'    : 'green',      # 'blue',
        'Threaded'      : 'cyan',       # 'purple',
        'Threadedi'     : 'cyan',       # 'purple',
        'h4-mlt-scr'    : 'orange',
        'h5-lnr-hyb'    : 'purple',     # 'red',
        'h6-crt-pth'    : 'brown'
    }

    sched_labels = {
        'RT-Gang'       : 'RT-Gang',
        'RTG-Sync'      : 'Virtual-Gang',
        'RTG-Synci'     : 'Virtual-Gang (Ideal)',
        'GFTP'          : 'Gang FTP',
        'GFTPi'         : 'Gang FTP (Ideal)',
        'Threaded'      : 'Threaded',
        'Threadedi'     : 'Threaded (Ideal)',
        'h2-lnr-hyb'    : 'Virtual-Gang (Greedy)',
        'h5-lnr-hyb'    : 'h5-lnr-hyb',
        'h6-crt-pth'    : 'h6-crt-pth'
    }

    sched_markers = {
        'RT-Gang'       : 'o',
        'RTG-Sync'      : '*',
        'RTG-Synci'     : '*',
        'GFTP'          : '^',
        'GFTPi'         : '^',
        'h2-lnr-hyb'    : '8',
        'Threaded'      : 's',
        'Threadedi'     : 's',
        'h4-mlt-scr'    : 'd',
        'h5-lnr-hyb'    : 'p',
        'h6-crt-pth'    : 'x'
    }

    sched_ratio = {s: {} for s in schedulers}

    print "[PROGRESS] Performing RTA..."
    num_of_tasksets = len(tasksets)
    idx = 1
    for tsIdx in tasksets:
        u_tasksets = tasksets[tsIdx]

        for u, ts in u_tasksets.items():
            for s in schedulers:
                if not sched_ratio[s].has_key(u):
                    sched_ratio[s][u] = 0

                print "[PROGRESS]   Analyzing: U=%2d | Scheduler=%20s | " \
                        "Taskset: %5d / %-5d\r" % (u, s, tsIdx + 1,
                                num_of_tasksets),

                gen_dir = 'generated/%s_e%d_r%s/ts%d_u%d_p' % (TASKSET_TYPE,
                        EDGE_PROBABILITY, DEMAND_TYPE, tsIdx, u)

                if not GFTP_DRYRUN:
                    schedulable = rta.run(ts, s)
                else:
                    schedulable = rta.run(ts, s, gen_dir, True)

                if not DEBUG:
                    sched_ratio[s][u] += schedulable
                else:
                    sched_ratio[s][u] = schedulable

            # if DEBUG:
            #     smt_schedulable = sched_ratio['RTG-Sync'][u]
            #     all_else_schedl = any([sched_ratio[s][u] for s in schedulers if s != 'RTG-Sync'])

            #     if smt_schedulable and not all_else_schedl:
            #         with open('dbg_workbook.txt', 'w') as fdo:
            #             fdo.write('-' * 50 + '\n')
            #             fdo.write('Taskset:\n')
            #             dbg_print_vgangs(fdo, ts, 'Real', '')
            #             dbg_print_vgangs(fdo, ts, 'Virtual', 'SMT')
            #             dbg_print_vgangs(fdo, ts, 'h1-len-dsc', 'H1')
            #             dbg_print_vgangs(fdo, ts, 'h2-lnr-hyb', 'H2')
            #             dbg_print_vgangs(fdo, ts, 'h4-mlt-scr', 'H4')
            #             dbg_print_vgangs(fdo, ts, 'h5-lnr-hyb', 'H5')
            #             dbg_print_vgangs(fdo, ts, 'h6-crt-pth', 'H6')

            #         sys.exit()

    # For GFTP dry-run, we cannot create plots yet
    if GFTP_DRYRUN: sys.exit()

    sched_hash_file = 'plot_data/%s_e%d_r%s.json' % (TASKSET_TYPE,
            EDGE_PROBABILITY, DEMAND_TYPE)

    with open(sched_hash_file, 'w') as fdi:
        json.dump(sched_ratio, fdi)

    print "[PROGRESS] Creating plots..."
    # create_sched_plots(sched_ratio, schedulers, color_scheme, sched_labels,
    #         sched_markers, 'bar')

    create_sched_plots(sched_ratio, schedulers, color_scheme, sched_labels,
            sched_markers, 'line')
    print "[PROGRESS Done!"

    return

def dbg_print_vgangs(fdo, ts, s, label):
    if label: fdo.write('  * %s\n' % (label))

    for p in ts:
        fdo.write('    - Period=%d\n' % (p))
        fdo.write('\n'.join(['      + %s' % t for t in ts[p][s]]) + '\n')
        fdo.write('        = %d\n' % (sum([t.c for t in ts[p][s]])))
    fdo.write('\n')

    return

def stratify_data(data, idx, wd):
    x = [v + (idx * wd) for v in sorted(data.keys())] + [NUM_OF_CORES]
    y = [data[v] for v in sorted(data.keys())] + [0]

    return x, y

def create_sched_plots(sched_hash, sched_list, clist, slabels, smarks,
        plot_type):

    fig = plt.subplots(1, 1, figsize = (10, 8))

    idx = -3
    wd = 0.1 if plot_type == 'bar' else 0.0

    for s in sched_list:
        ls = '-'
        if s[-1] == 'i': ls = '--'

        x, y = stratify_data(sched_hash[s], idx, wd)
        idx += 1

        if plot_type == 'bar':
            plt.bar(x, y, color = clist[s], width = wd, lw = 1.0,
                    edgecolor = 'black', label = slabels[s])

            continue

        plt.plot(x, y, lw = 1.5, color = clist[s], marker = smarks[s],
                label = slabels[s], linestyle = ls)

    plt.xlim([0.5, NUM_OF_CORES + 0.5])
    plt.ylim([0, NUM_OF_TEST_TASKSETS * 1.05])
    plt.xlabel('Utilizations', fontsize = 'x-large', fontweight = 'bold')
    plt.ylabel('Schedulable Tasksets', fontsize = 'x-large',
            fontweight = 'bold')

    plt.title(TASKSET_TYPE.capitalize(), fontsize = 'xx-large',
            fontweight = 'bold')

    if TASKSET_TYPE == 'mixed': plt.legend(fontsize = 'x-large')

    plt.savefig('plots_for_paper/%s_e%d_r%s_%s.png' % (TASKSET_TYPE,
        EDGE_PROBABILITY, DEMAND_TYPE, plot_type))

    return

def dbg_single_candidate_set():
    taskset_dir = 'gen_%s/' % (TASKSET_TYPE) + CANDIDATE_SET
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
        parser = Aggregator(TASKSET_TYPE)
        candidate_set = parser.parse_taskset(CANDIDATE_SET, 'real')
        tsIdx, util, period = parser.parse_taskset_dir(CANDIDATE_SET)

    banner = "\t" + "-" * 16 + " Candidate Set " + "-" * 18 + "\n"
    print_single_candidate_set(sys.stdout, candidate_set, banner)

    vgc_params = {
        'stop_interval'     : 1,
        'timeout'           : 1,
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
    for r in range(1, NUM_OF_TEST_TASKSETS, PARALLELISM):
        for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
            processes[tsIdx] = multiprocessing.Process(target = \
                    virtual_gang_generator_thread_entry, args = (tsIdx,))

            processes[tsIdx].start()

        for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
            processes[tsIdx].join()

    print '\n'

    return

def set_rd1(candidate_set):
    for t in candidate_set:
        t.r = 1

    return

def virtual_gang_generator_thread_entry(tsIdx):
    # Generate taskset and then create SMT script
    tf_params = {
        'seed'              : tsIdx + 1,
        'demand_type'       : DEMAND_TYPE,
        'num_of_cores'      : NUM_OF_CORES,
        'utils'             : UTILIZATIONS,
        'edge_prob'         : EDGE_PROBABILITY,
    }

    taskFactory = Generator(tf_params)
    taskset = taskFactory.create_taskset(TASKSET_TYPE)

    virtual_taskset = {}
    for util in taskset:
        vg_idx = 0
        virtual_taskset[util] = {}

        for period, candidate_set in taskset[util].items():
            if SMT_IDEAL:
                set_rd1(candidate_set)
                DEMAND_TYPE = '0'

            gen_dir = '/generated/%s_e%d_r%s' % (TASKSET_TYPE, EDGE_PROBABILITY,
                    DEMAND_TYPE)

            vgc_params = {
                'stop_interval'     : 1,
                'timeout'           : 2,
                'max_timeout'       : 30,
                'utilization'       : util,
                'taskset_index'     : tsIdx,
                'verify'            : True,
                'debug'             : False,
                'period'            : period,
                'gen_dir'           : gen_dir,
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
