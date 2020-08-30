#!/usr/bin/env python

import multiprocessing
import os, sys, re, shutil
from taskFactory import Task
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

SEED = 5
PRISTINE = True
NUM_OF_CORES = 8
EDGE_PROBABILITY = 25
MAX_TASKS_PER_PERIOD = 8
NUM_OF_TEST_TASKSETS = 1000
UTILIZATIONS = range(1, NUM_OF_CORES)
RESULT_FILE = 's%d_vgangs.txt' % (SEED)
PARALLELISM = multiprocessing.cpu_count() * 2

def main():
    if PRISTINE:
        processes = {}

        # Remove generated directory for pristine execution
        generated_dir = os.getcwd() + '/generated'
        if os.path.exists(generated_dir): shutil.rmtree(generated_dir)

        print
        for r in range(0, NUM_OF_TEST_TASKSETS, PARALLELISM):
            for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
                processes[tsIdx] = multiprocessing.Process(target = \
                        form_virtual_gangs, args = (tsIdx,))

                processes[tsIdx].start()

            for tsIdx in range(r, min(r + PARALLELISM, NUM_OF_TEST_TASKSETS)):
                processes[tsIdx].join()

        print '\n'

    tasksets = aggregate_tasksets()
    dbg_dump_vgang_info(tasksets)

    return

def aggregate_tasksets():
    '''
      Traverse the directory containing generated tasksets and their respective
      virtual-gangs data for further processing.
    '''
    assert os.path.exists('generated'), ("Directory of generated data does "
        "not exists in the current folder.")

    tasksets = {}
    generated_taskset_dirs = os.listdir('generated')

    for ts in generated_taskset_dirs:
        tsIdx, util, period = parse_taskset_dir(ts)

        if not tasksets.has_key(tsIdx):
            tasksets[tsIdx] = {}

        if not tasksets[tsIdx].has_key(util):
            tasksets[tsIdx][util] = {}

        if not tasksets[tsIdx][util].has_key(period):
            tasksets[tsIdx][util][period] = {}

        tasksets[tsIdx][util][period]['Real'] = parse_taskset(ts, 'real')
        tasksets[tsIdx][util][period]['Virtual'] = parse_taskset(ts, 'virtual')

    return tasksets

def parse_taskset(taskset_dir, nature):
    name_prefix = 'candidate_' if nature == 'real' else 'virtual_task'
    taskset_file = 'generated/%s/%sset.txt' % (taskset_dir, name_prefix)

    assert os.path.exists(taskset_file), ("Taskset file <%s> does "
            "not exists in the generated directory." % (taskset_file))

    pattern = '^Task:\s+([\d]+) \| C=\s*([\d.]+) P=\s*([\d]+) h=\s*([\d]+)' + \
        ' r=\s*([\d]+) u=\s*([\d.]+) ([^\s]+)$'

    taskset = []
    with open(taskset_file, 'r') as fdi:
        lines = fdi.readlines()

        for l in lines:
            m = re.match(pattern, l)

            if not m:
                continue

            tid = int(m.group(1))
            C = float(m.group(2))
            p = int(m.group(3))
            h = int(m.group(4))
            r = int(m.group(5))
            u = float(m.group(6))

            e = []
            members = ''
            if nature == 'real': e = parse_edges(m.group(7))
            if nature == 'virtual': members = m.group(7)[2:]

            taskset.append(Task(tid, C, p, h, r, e, members))

    return taskset

def parse_edges(edge_string):
    if edge_string == 'None':
        return []

    pattern = r'->t([\d]+)'
    edge_list = [int(e) for e in re.findall(pattern, edge_string)]

    return edge_list

def parse_taskset_dir(ts_dir):
    pattern = r'ts([\d]+)_u([\d]+)_p([\d]+)'
    m = re.match(pattern, ts_dir)

    assert m, ("Taskset directory <%s> does not match expected pattern.")

    tsIdx = int(m.group(1))
    util = int(m.group(2))
    period = int(m.group(3))

    return tsIdx, util, period

def form_virtual_gangs(tsIdx):
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

def dbg_dump_vgang_info(tasksets):
    rem_result_file()

    for tsIdx in tasksets:
        with open(RESULT_FILE, 'a') as fdo:
            print_taskset(fdo, tasksets[tsIdx], tsIdx)

            fdo.write('\n')

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

def print_progress(cur_taskset, max_tasksets, cur_util, max_util, period):
    print '[PROGRESS] Processing Taskset: %4d / %-4d | Utilization: %2d '   \
            '/ %-2d | Period: %4d\r' % (cur_taskset, max_tasksets, cur_util, \
                    max_util, period),

    sys.stdout.flush()

    return

def rem_result_file():
    if os.path.exists(RESULT_FILE):
        os.remove(RESULT_FILE)

    return

if __name__ == '__main__':
    main()
