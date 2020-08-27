import os, re
from time import time
from threading import Timer
from subprocess import Popen, PIPE

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

class SMT:
    def __init__(self, params):
        required_params = ['candidate_set', 'num_of_cores', 'timeout', 'tpp',
                'max_timeout', 'gen_dir']

        for req_param in required_params:
            assert params.has_key(req_param), ("%s is a required parameter "
                    "for SMT class" % (req_param))

            setattr(self, req_param, params[req_param])

        assert os.path.exists(self.gen_dir), ("Directory for generated "
                "artefacts <%s> does not exist." % (self.gen_dir))

        self.script_dir = '%s/scripts' % (self.gen_dir)
        os.mkdir(self.script_dir)

        return

    def run(self, max_gang_length):
        script = self.__generate(max_gang_length)
        output = self.__run_script(script, self.timeout)

        return script, output

    def parse(self, output):
        regex = "define-fun ([mls])([\d]+).*\n[\D]+([\d]+)"
        vgangs = re.findall(regex, output)

        return vgangs

    def verify(self, script):
        return self.__run_script(script, self.max_timeout)

    def __generate(self, max_gang_length):
        num_of_vgangs = len(self.candidate_set) - 1
        output_file = '%s/gl%d.smt2' % (self.script_dir, max_gang_length)

        with open(output_file, 'w') as fdo:
            fdo.write(smt_hdr)

            # Write mapping of tasks to virtual gangs
            mapping_line = "(declare-const m%d Int) ; h = %d, c = %3d, r = %d\n"
            idx = 1
            for t in self.candidate_set:
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
            for t in self.candidate_set:
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

                for t in self.candidate_set:
                    clause = height_assert_clause % (idx, l, t.h)
                    line += clause
                    line += ') ' if idx > 1 else ' '
                    idx += 1

                line += "%d ))\n" % self.num_of_cores
                fdo.write(line)
            fdo.write('\n')

            # Handle precedence constraint line
            # For each tau_n in tau_i.e => tau_i -> tau_n i.e., there is an
            # edge b/w tau_i and tau_n and hence tau_i must run before tau_n.
            # In SMT syntax => m_i < m_n
            idx = 0
            precedence_line = "(assert ( < m%d m%d ))\n"
            for t in self.candidate_set:
                idx += 1
                if not t.e:
                    continue

                for tnext in t.e:
                    tnedge = tnext % self.tpp
                    if tnedge == 0: tnedge = self.tpp
                    line = precedence_line % (idx % self.tpp, tnedge)
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

                for t in self.candidate_set:
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
                for t in self.candidate_set:
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

    def __run_script(self, script, timeout):
        p = Popen(["z3", script], stdout = PIPE, stderr = PIPE)
        timer = Timer(timeout, p.kill)

        '''
          Timeout Implementation for Unsat

          We assume that the solution is "unsat" if z3 takes more than a
          specific amount of time <timout> to compute it. In this case, the
          timer callback would be the first function to return in the following
          "try" block. In the "finally" block, we will cancel the timer which,
          in turn, will kill the z3 process.

          When this happens, both stdout and stderr would be empty and the
          caller of this function treats empty stdout as UNSAT by z3.
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
