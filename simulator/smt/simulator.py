#!/usr/bin/env python

from tasksetGenerator import Generator
from subprocess import Popen, PIPE
from taskFactory import Task
from threading import Timer
from random import randint
from time import time
import re, sys

M = 8
tpp = 8
DEBUG = False
UNSAT_TIMEOUT_SEC = 2
EDGE_PROBABILITY = 50
UNSAT_MAX_TIMEOUT_SEC = 300
VERIFY_LAST_UNSAT_SOL = True
VGANG_TOLERANCE_DELTA = 1.0

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
        taskFactory = Generator(M, [M], EDGE_PROBABILITY, tpp)
        taskset = taskFactory.create_taskset('light')
        candidate_set, period = test_candidate_set(taskset[M], True)

    dbg_print_set(candidate_set)
    start = time()
    optimal_solution = smt_binary_search_length(candidate_set, period, True)
    duration = "%.3f" % (time() - start)

    print "=== Optimal Solution obtained in: %s seconds!\n" % (duration)


    first_task_tid = candidate_set [0].tid - 1
    virtual_gangs = parse_script_output(optimal_solution, first_task_tid)
    verify_virtual_gangs(candidate_set, virtual_gangs)

    return

def task_list_to_string(task_list):
    assert task_list != [], ("Task list cannot be empty!")

    return ','.join(['t%d' % t.tid for t in task_list])

def get_task_by_tid(task_list, tid):
    assert task_list != [], ("Task list cannot be empty!")

    for t in task_list:
        if t.tid == tid:
            return t

    raise ValueError, "Task <t%d> not found in list: %s" % (tid,
            task_list_to_string(task_list))

def verify_virtual_gangs(candidate_set, virtual_gangs):
    '''
      Given the taskset and computed virtual-gangs, perform simple sanity tests
      to verify that the solution is correct. Here is a list tests that are
      performed at the moment:
        - Check that the length of the virtual-gangs matches with the sum of
          the length of constituent tasks and their calculated resource demand
    '''
    for vg in virtual_gangs.values():
        vg_length = vg['C']
        vg_demand = int(vg['r'])
        vg_members = vg['members']

        expected_gang_length = 0
        expected_gang_demand = 0

        for tid in vg_members:
            task = get_task_by_tid(candidate_set, tid)
            expected_gang_length = max(task.c, expected_gang_length)
            expected_gang_demand += task.r
        expected_gang_demand = max(100, expected_gang_demand)

        assert expected_gang_demand == vg_demand, ("The expected resource "
                "demand <%d> of the virtual-gang does not match the "
                "calculated resource demand <%d>" % (expected_gang_demand,
                    vg_demand))

        expected_gang_length *= (expected_gang_demand / 100.0)
        delta_gang_length = abs(vg_length - expected_gang_length)

        assert delta_gang_length < VGANG_TOLERANCE_DELTA, ("The delta in "
                "expected virtual-gang length <%.3f> and the calculated "
                "virtual-gang length <%.3f> is more than tolerance mergin "
                "<%.3f>" % (expected_gang_length, vg_length,
                    VGANG_TOLERANCE_DELTA))

    return


def update_gang_length(cur_length, prev_length, down):
    step = abs(cur_length - prev_length) / 2
    prev_length = cur_length
    cur_length = (cur_length - step) if down else (cur_length + step)

    return cur_length, prev_length

def smt_binary_search_length(candidate_set, period, debug = False):
    '''
      Generate SMT script, with the total gang length constraint set to the
      max. value at start and reducing it by half in each iteration until it
      can't be reduced further. The solution with minimal gang length is the
      best for the given problem.
    '''
    prev_gang_length = 0
    unsat_gang_length = 0
    last_unsat_script = 0
    optimal_solution = None
    max_gang_length = sum([t.c for t in candidate_set]) * 100

    if debug:
        iteration = 0
        tbl_fmt = "%-10s | %-15s | %-15s | %-15s"
        tbl_hdr = tbl_fmt % ("Iteration", "Cur. Length", "Next Length",
                "Time (sec)")
        hdr_len = len(tbl_hdr) - 1
        hrule = "-" * hdr_len

        print "=================== SMT Binary Search Debug ==================="
        print tbl_hdr
        print hrule

    while (1):
        smt_script = gen_smt_script(candidate_set, max_gang_length, period)

        start = time()
        solution = run_smt_script(smt_script)
        duration = "%.3f" % (time() - start)

        if not solution:
            if not optimal_solution:
                raise ValueError, "SMT not able to find any solutions!"

            # Keep track of the last unsat solution. We will have to run it to
            # completion to verify it.
            last_unsat_script = smt_script
            unsat_gang_length = max_gang_length

            # Model not satisfied. Search up.
            max_gang_length, prev_gang_length = \
                update_gang_length(max_gang_length, prev_gang_length, False)
        else:
            # The model was satisifed. Search down.
            optimal_solution = solution

            max_gang_length, prev_gang_length = \
                update_gang_length(max_gang_length, prev_gang_length, True)

        if debug:
            iteration += 1
            print tbl_fmt % (iteration, prev_gang_length, max_gang_length,
                    duration)

        if (max_gang_length == prev_gang_length):
            # Run the last unsat solution to completion. It must be unsat; in
            # order for the current solution to be truly optimal
            if debug:
                print "\n  -- Verifying last unsat solution: %s" % \
                        (last_unsat_script)

            unsat, time_taken = verify_last_unsat_solution(last_unsat_script)

            if not unsat:
                # Last unsat solution was not truly unsat. We must continue
                # binary search downward
                print "[WARNING] Last unsat solution was not truly unsat:"
                print "          - Gang Length =", unsat_gang_length
                print "          -  SMT Script =", last_unsat_script

                max_gang_length = unsat_gang_length / 2
                prev_gang_length = unsat_gang_length
                continue

            if debug:
                print "  -- Last unsat solution verified in %s seconds\n" % \
                        (time_taken)

            # Last solution was truly unsat. We can end binary search
            break

    if debug:
        print hrule
        print

    return optimal_solution

def verify_last_unsat_solution(script):
    # We are not verifying the last unsat solution
    if not VERIFY_LAST_UNSAT_SOL:
        return True, 0

    unsat = False
    start = time()
    solution = run_smt_script(script, UNSAT_MAX_TIMEOUT_SEC)
    duration = "%.3f" % (time() - start)

    if float(duration) > UNSAT_MAX_TIMEOUT_SEC:
        print "[ERROR] Final unsat solution was not computed within timeout!"
        sys.exit(1)

    if not solution:
        unsat = True

    return unsat, duration

def dbg_print_config(gdict):
    tbl_fmt = "%-20s | %-20s | %-10s | %-5s"
    header = tbl_fmt % ("Virtual-Gang ID", "Members", "L", "r")
    hrule = "-" * len(header)

    print hrule
    print header
    print hrule

    for g in gdict:
        members = '+'.join(["t%s" % (tid) for tid in gdict[g]["members"]])
        print tbl_fmt % (g, members, gdict[g]["C"], gdict[g]["r"])
    print hrule

    return

def stratify_data(vgangs, ftid):
    '''
      vgangs is a list of tuples.
      Each tuple has the following format:
        ( <Type: l = length | m = membership | s = slowdown>, <ID>, <value> )

      For example:
        ('m', '4', '8') means:
          - Task 4 was assigned to virtual-gang # 8.
        ('l', '6', '8000') means:
          - The virtual-gang # 6 has a length (i.e., C) of 80 TUs.
        ('s', '7', '126') means:
          - Each task in virtual-gang will have 1.26x slowdown.

      We want to convert this data into the following dictionary:
      {
        key = Gang-ID,
        value = {
                    key = "members",
                    value = [IDs of member tasks],
                    key = "C",
                    value = Gang length,
                    key = "r",
                    value = Resource demand (i.e., Slowdown) factor of gang
                }
      }

      For example: gang_dict [1]["members"] => list of member tasks of gang # 1
    '''
    gang_dict = {}

    for (t, i, v) in vgangs:
        if t == 'm':
            if v not in gang_dict:
                gang_dict [v] = {"members": [int(i) + ftid]}
                continue
            gang_dict [v]["members"].append(int(i) + ftid)
        elif t == 'l' or t == 's':
            if i not in gang_dict:
                gang_dict [i] = {"members": []}

            if t == 'l':
                gang_dict [i]["C"] = int(v) / 100.0
            else:
                gang_dict [i]["r"] = v
        else:
            raise ValueError, "Unexpected entry in SMT solution: ", t

    # We may get gangs with no members since the SMT solver tries to create a
    # fixed number of gangs and gives one solution that satisfies the problem.
    # We delete the empty gangs here.
    empty_gangs = []
    for g in gang_dict:
        if not gang_dict[g]["members"]:
            empty_gangs.append(g)

    for vg in empty_gangs:
        del gang_dict[vg]

    return gang_dict

def reorder_virtual_gangs(vgangs):
    ordered_gang_dict = {}
    gang_ids = sorted(vgangs.keys())

    vidx = 1
    for vgid in gang_ids:
        ordered_gang_dict[vidx] = vgangs[vgid]
        vidx += 1

    return ordered_gang_dict

def parse_script_output(output, first_task_tid):
    regex = "define-fun ([mls])([\d]+).*\n[\D]+([\d]+)"
    vgangs = re.findall(regex, output)

    gang_dict = stratify_data(vgangs, first_task_tid)
    ordered_gang_dict = reorder_virtual_gangs(gang_dict)
    dbg_print_config(ordered_gang_dict)

    return ordered_gang_dict

def run_smt_script(script_name, timeout = UNSAT_TIMEOUT_SEC):
    p = Popen(["z3", script_name], stdout = PIPE, stderr = PIPE)
    timer = Timer(timeout, p.kill)

    '''
      Timeout Implementation for Unsat

      We assume that the solution is "unsat" if z3 takes more than a specific
      amount of time <UNSAT_TIMEOUT_SEC> to compute it. In this case, the timer
      callback would be the first function to return in the following "try"
      block. In the "finally" block, we will cancel the timer which, in turn,
      will kill the z3 process.

      When this happens, both stdout and stderr would be empty and the caller
      of this function treats empty stdout as UNSAT by z3.
    '''
    try:
        timer.start()
        stdout, stderr = p.communicate()
    finally:
        timer.cancel()

    if stderr:
        raise IOError, "Unexpected output from z3: %s" % (stderr)

    if "unsat" in stdout:
        return None

    return stdout

def dbg_print_taskset(taskset):
    print "================ DEBUG ==============="
    for T in taskset:
        print "Period=%d" % (T)
        for t in taskset[T]:
            print "  ", t
        print "-" * 25

    return

def dbg_print_set(candidate_set, debug = True):
    if debug:
        print "\n============== Candidate Set =============="
        for t in candidate_set: print t
        print

    return

def test_candidate_set(taskset, debug = False):
    # Select just one task-list in taskset with 5 tasks in it
    candidate_set = None
    period = 0

    for T in taskset:
        if len(taskset[T]) == tpp:
            candidate_set = taskset[T]
            period = T
            break

    if not candidate_set:
        dbg_print_taskset(taskset)
        raise ValueError, "Candidate set cannot be empty!"

    return candidate_set, period

smt_hdr = \
'''\
; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

'''

smt_ftr = \
'''
(check-sat)
(get-model)
'''

def gen_smt_script(candidate_set, max_gang_length, period):
    output_file = "u%d_p%d_g%d.smt2" % (M, period, max_gang_length)
    num_of_vgangs = len(candidate_set) - 1

    with open(output_file, 'w') as fdo:
        fdo.write(smt_hdr)

        # Write mapping of tasks to virtual gangs
        mapping_line = "(declare-const m%d Int) ; h = %d, c = %3d, r = %d\n"
        idx = 1
        for t in candidate_set:
            line = mapping_line % (idx, t.h, t.c, t.r)
            fdo.write(line)
            idx += 1
        fdo.write('\n')

        # Write virtual gang interference slowdowns
        slowdown_line = "(declare-const s%d Int)\n"
        for idx in range(1, num_of_vgangs + 1):
            line = slowdown_line % (idx)
            fdo.write(line)
        fdo.write('\n')

        # Write virtual gang lengths
        length_line = "(declare-const l%d Int)\n"
        for idx in range(1, num_of_vgangs + 1):
            line = length_line % (idx)
            fdo.write(line)
        fdo.write('\n')

        # Write mapping assert line
        mapping_assert_line = "(assert (and (<= 1 m%d) (<= m%d %d)))"
        mapping_assert_line += " ; 1 <= m%d <= %d\n"
        idx = 1
        for t in candidate_set:
            line = mapping_assert_line % (idx, idx, num_of_vgangs,
                    idx, num_of_vgangs)
            fdo.write(line)
            idx += 1
        fdo.write('\n')

        # Write height assert line
        #   # of lines = # of vgangs
        #   Clauses per line = # of tasks
        height_assert_clause = "(ite (= m%d %d) %d 0)"
        for l in range(1, num_of_vgangs + 1):
            idx = 1

            # Here we should have num_of_tasks - 1 instead of num_of_vgangs
            line = "(assert ( <= " + "(+ " * num_of_vgangs

            for t in candidate_set:
                clause = height_assert_clause % (idx, l, t.h)
                line += clause
                line += ') ' if idx > 1 else ' '
                idx += 1

            line += "%d ))\n" % M
            fdo.write(line)
        fdo.write('\n')

        # Handle precedence constraint line
        # For each tau_n in tau_i.e => tau_i -> tau_n i.e., there is an edge b/w
        # tau_i and tau_n and hence tau_i must run before tau_n.
        # In SMT syntax => m_i < m_n
        idx = 0
        precedence_line = "(assert ( < m%d m%d ))\n"
        for t in candidate_set:
            idx += 1
            if not t.e:
                continue

            for tnext in t.e:
                tnedge = tnext % tpp
                if tnedge == 0: tnedge = tpp
                line = precedence_line % (idx % tpp, tnedge)
                fdo.write(line)
        fdo.write('\n')

        # Write interference slowdown line
        #  2nd line format
        #  # of lines = # of vgangs
        #  Clauses per line = # of tasks
        slowdown_assert_line1 = "(assert (>= s%d 100))\n"
        line2_clause = "(ite (= m%d %d) %d 0)"
        for l in range(1, num_of_vgangs + 1):
            idx = 1
            line1 = slowdown_assert_line1 % l

            # Here we should have num_of_tasks - 1 instead of num_of_vgangs
            line2 = "(assert (>= s%d " % (l) + "(+ " * num_of_vgangs

            for t in candidate_set:
                clause = line2_clause % (idx, l, t.r)
                line2 += clause
                line2 += ') ' if idx > 1 else ' '
                idx += 1

            line2 += "))\n"
            fdo.write(line1)
            fdo.write(line2)
        fdo.write('\n')

        # Write gang length computation line
        #  line = (assert (or (not <clause-1>) (>= <clause-2>)))
        #  # of clause-1 = # of tasks
        #  # of clause-2 = # of vgangs
        length_assert_line = "(assert (>= l%d 0))\n"
        clause_1 = "(= m%d %d)"
        clause_2 = "l%d (* %3d s%d)"
        line = "(assert (or (not %s) (>= %s)))\n"
        for l in range(1, num_of_vgangs + 1):
            idx = 1

            fdo.write(length_assert_line % (l))
            for t in candidate_set:
                c1 = clause_1 % (idx, l)
                c2 = clause_2 % (l, t.c, l)
                fdo.write(line % (c1, c2))
                idx += 1
        fdo.write('\n')

        # Write gang length constraint line
        line = "(assert (= %s %d ))\n"

        if num_of_vgangs == 1:
            clause = "l1"
        else:
            clause = "(+ l1 l2)"
            for l in range(3, num_of_vgangs + 1):
                clause = "(+ %s l%d)" % (clause, l)
        fdo.write(line % (clause, max_gang_length))

        fdo.write(smt_ftr)

    return output_file

if __name__ == '__main__':
    main()
