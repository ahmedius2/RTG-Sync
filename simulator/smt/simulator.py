#!/usr/bin/env python

from tasksetGenerator import Generator
from subprocess import Popen, PIPE
from taskFactory import Task
from random import randint
import re

tpp = 4
M = 4
DEBUG = 2

def main():
    if DEBUG == 1:
        # Generate SMT script for sample taskset
        period = 100
        candidate_set = [Task(1, 30, period, 3, 30),
                         Task(2, 20, period, 2, 50),
                         Task(3, 40, period, 2, 70)]
    elif DEBUG == 2:
        period = 248
        candidate_set = [Task(1, 29, period, 3, 10),
                         Task(2, 37, period, 2, 47),
                         Task(3, 27, period, 1, 57),
                         Task(4, 34, period, 4, 31)]
    else:
        # Generate taskset and then create SMT script
        taskFactory = Generator(M, [M], tpp)
        taskset = taskFactory.create_taskset('mixed')
        candidate_set, period = test_candidate_set(taskset[M], True)

    dbg_print_set(candidate_set)
    smt_script = gen_smt_script(candidate_set, period)
    run_smt_script(smt_script)

    return

def dbg_print_config(gdict):
    tbl_fmt = "%-20s | %-10s | %-10s | %-5s"
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

def stratify_data(vgangs):
    # vgangs is a list of tuples.
    # Each tuple has the following format:
    #   ( <Type: l = length | m = membership | s = slowdown>, <ID>, <value> )
    #
    # For example:
    #   ('m', '4', '8') means:
    #     - Task 4 was assigned to virtual-gang # 8.
    #   ('l', '6', '8000') means:
    #     - The virtual-gang # 6 has a length (i.e., C) of 80 TUs.
    #   ('s', '7', '126') means:
    #     - Each task in virtual-gang will have 1.26x slowdown.
    #
    # We want to convert this data into the following dictionary:
    # {
    #   key = Gang-ID,
    #   value = {
    #               key = "members",
    #               value = [IDs of member tasks],
    #               key = "C",
    #               value = Gang length,
    #               key = "r",
    #               value = Resource demand (i.e., Slowdown) factor of gang
    #           }
    # }
    #
    # For example: gang_dict [1]["members"] => list of member tasks of gang # 1
    gang_dict = {}

    for (t, i, v) in vgangs:
        if t == 'm':
            if v not in gang_dict:
                gang_dict [v] = {"members": [i]}
                continue
            gang_dict [v]["members"].append(i)
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

def parse_script_output(output):
    regex = "define-fun ([mls])([\d]+).*\n[\D]+([\d]+)"
    vgangs = re.findall(regex, output)

    gang_dict = stratify_data(vgangs)
    dbg_print_config(gang_dict)

    return

def run_smt_script(script_name):
    p = Popen(["z3", script_name], stdout = PIPE, stderr = PIPE)
    stdout, stderr = p.communicate()

    if stderr:
        raise IOError, "Unexpected output from z3: ", stderr

    # parse_script_output(stdout)
    if "sat" not in stdout:
        raise ValueError, "Model not satisfied: ", stdout

    # print stdout
    parse_script_output(stdout)

    return

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

def gen_smt_script(candidate_set, period):
    output_file = "u%d_p%d.smt2" % (4, period)
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

        # TODO Handle precedence constraint line

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
        clause_1 = "(= m%d %d)"
        clause_2 = "l%d (* %3d s%d)"
        line = "(assert (or (not %s) (>= %s)))\n"
        for l in range(1, num_of_vgangs + 1):
            idx = 1

            for t in candidate_set:
                c1 = clause_1 % (idx, l)
                c2 = clause_2 % (l, t.c, l)
                fdo.write(line % (c1, c2))
                idx += 1
        fdo.write('\n')

        # Write gang length constraint line
        max_length = sum([t.c for t in candidate_set]) * 100
        line = "(assert (= %s %d ))\n"

        if num_of_vgangs == 1:
            clause = "l1"
        else:
            clause = "(+ l1 l2)"
            for l in range(3, num_of_vgangs + 1):
                clause = "(+ %s l%d)" % (clause, l)
        fdo.write(line % (clause, max_length))

        fdo.write(smt_ftr)

    return output_file

if __name__ == '__main__':
    main()
