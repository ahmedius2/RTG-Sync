#!/usr/bin/env python

from tasksetGenerator import Generator
from taskFactory import Task

tpp = 3
M = 4
DEBUG = True

def main():
    if DEBUG:
        # Generate SMT script for sample taskset
        period = 100
        candidate_set = [Task(1, 30, period, 3, 30),
                         Task(2, 20, period, 2, 50),
                         Task(3, 40, period, 2, 70)]
    else:
        # Generate taskset and then create SMT script
        taskFactory = Generator(M, [M], tpp)
        taskset = taskFactory.create_taskset('mixed')
        candidate_set, period = test_candidate_set(taskset[M], False)

    gen_smt_script(candidate_set, period)

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
        raise ValueError, "Candidate set cannot be empty!"

    if debug:
        print "\n============== Candidate Set =============="
        for t in candidate_set: print t
        print

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
