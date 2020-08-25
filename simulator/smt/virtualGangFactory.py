from time import time
from smtFactory import SMT
from taskFactory import Task

class VirtualGangCreator:
    def __init__(self, params):
        required_params = ['candidate_set', 'num_of_cores', 'period',
                'tasks_per_period']

        default_optional_params = {
            'timeout'       : 2,
            'max_timeout'   : 300,
            'tolerance'     : 1.0,
            'time'          : False,
            'debug'         : False,
            'verify'        : True
        }

        for req_param in required_params:
            assert params.has_key(req_param), ("%s is a required parameter "
                    "for VirtualGangGenerator class" % (req_param))

            setattr(self, req_param, params[req_param])

        # Optional Parameters; assume default values if not provided
        for opt_param in default_optional_params.keys():
            if opt_param in params.keys():
                setattr(self, opt_param, params[opt_param])
                continue

            setattr(self, opt_param, default_optional_params[opt_param])

        assert self.candidate_set != [], ("Candidate set cannot be empty!")
        assert self.num_of_cores >= 4, ("Virtual-Gang generator expects "
                "at-least 4 cores. Given core count = %d" % self.num_of_cores)

        # Init SMT class for solving virtual-gang satisfiability problems
        smt_params = {
            'debug'         : self.debug,
            'timeout'       : self.timeout,
            'max_timeout'   : self.max_timeout,
            'num_of_cores'  : self.num_of_cores,
            'candidate_set' : self.candidate_set,
            'tpp'           : self.tasks_per_period
        }

        self.smt = SMT(smt_params)

        # Print candidate-set to console if we are in debug mode
        if self.debug: self.__print_candidate_set()

        return

    def run(self, first_vtask_tid):
        start = time()
        optimal_solution = self.__smt_binary_search_length(self.debug)
        duration = time() - start

        self.__print_time("=== Optimal solution obtained in: %.3f secs!\n"
                % (duration))

        virtual_gangs = self.__clean_smt_output(optimal_solution)
        self.__verify_virtual_gangs(virtual_gangs)

        virtual_taskset = \
                self.__create_virtual_taskset(virtual_gangs, first_vtask_tid)

        if self.debug: self.__print_vgangs(virtual_gangs)

        return virtual_taskset

    def __smt_binary_search_length(self, debug = False):
        '''
          Generate SMT script, with the total gang length constraint set to the
          max. value at start and reducing it by half in each iteration until
          it can't be reduced further. The solution with minimal gang length is
          the best for the given problem.
        '''
        prev_gang_length = 0
        unsat_gang_length = 0
        last_unsat_script = 0
        optimal_solution = None
        max_gang_length = sum([t.c for t in self.candidate_set]) * 100

        if debug:
            iteration = 0
            tbl_fmt = "%-10s | %-15s | %-13s | %-13s"
            tbl_hdr = tbl_fmt % ("Iteration", "Cu. Length", "Next Length",
                    "Time (sec)")
            hdr_len = len(tbl_hdr) - 1
            hrule = "-" * hdr_len

            print "================= SMT Binary Search Debug ================="
            print tbl_hdr
            print hrule

        while (1):
            start = time()
            script, solution = self.smt.run(max_gang_length)
            duration = time() - start

            if not solution:
                assert optimal_solution != None, ("SMT is not able to find "
                        "any feasible solutions")

                # Keep track of the last unsat solution. We will have to run it
                # to completion to verify it; at the end.
                last_unsat_script = script
                unsat_gang_length = max_gang_length

                # Model not satisfied. Search up.
                max_gang_length, prev_gang_length = \
                        self.__update_gang_length(max_gang_length,
                                prev_gang_length, False)
            else:
                # The model was satisifed. Search down.
                optimal_solution = solution

                max_gang_length, prev_gang_length = \
                        self.__update_gang_length(max_gang_length,
                                prev_gang_length, True)

            if debug:
                iteration += 1
                print tbl_fmt % (iteration, prev_gang_length, max_gang_length,
                        '%.3f' % (duration))

            if (max_gang_length == prev_gang_length):
                # Run the last unsat solution to completion. It must be unsat;
                # in order for the current solution to be truly optimal
                if debug:
                    print "\n  -- Verifying last unsat solution: %s" % \
                            (last_unsat_script)

                unsat, time_taken = \
                        self.__verify_last_unsat_solution(last_unsat_script)

                if not unsat:
                    # Last unsat solution was not truly unsat. We must continue
                    # binary search downward
                    print "[WARNING] Last unsat solution was not truly unsat:"
                    print "          - Gang Length =", unsat_gang_length
                    print "          -  SMT Script =", last_unsat_script

                    max_gang_length = unsat_gang_length / 2
                    prev_gang_length = unsat_gang_length
                    continue

                self.__print_time("  -- Last unsat solution verified in %.3f "
                        "secs\n" % (time_taken))

                # Last solution was truly unsat. We can end binary search
                break

        if debug: print hrule, '\n'

        return optimal_solution

    def __stratify_intm_gangs(self, vgangs):
        '''
          vgangs is a list of tuples.
          Each tuple has the following format:
            ( <Type: l = length | m = members | s = slowdown>, <ID>, <value> )

          We want to convert this data into the following dictionary:
          {
            key = Gang-ID,
            value = {
                        key = "members",
                        value = [IDs of member tasks],
                        key = "C",
                        value = Gang length,
                        key = "r",
                        value = Resource demand (i.e., Slowdown),
                        key = "h",
                        value = Height of the virtual-gang
                    }
          }

          For example: gang_dict [1]["members"] => list of members of gang # 1
        '''
        gang_dict = {}
        ftid = self.__get_first_tid()

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

        # We may get gangs with no members since the SMT solver tries to create
        # a fixed number of gangs and gives one solution that satisfies the
        # problem.  We delete the empty gangs here.
        empty_gangs = []
        for g in gang_dict:
            if not gang_dict[g]["members"]:
                empty_gangs.append(g)
            else:
                gang_dict[g]["h"] = \
                        self.__calc_vgang_height(gang_dict[g]["members"])

        for vg in empty_gangs:
            del gang_dict[vg]

        return gang_dict

    def __verify_virtual_gangs(self, virtual_gangs):
        '''
          Given the taskset and computed virtual-gangs, perform simple sanity
          tests to verify that the solution is correct. Here is a list tests
          that are performed at the moment:
            - Check that the length of the virtual-gangs matches with the sum
              of the length of constituent tasks and their calculated demand
            - Check that the height of the virutal-gangs fits within the cores
        '''
        for vg in virtual_gangs.values():
            vg_length = vg['C']
            vg_height = vg['h']
            vg_demand = int(vg['r'])
            vg_members = vg['members']

            expected_gang_length = 0
            expected_gang_demand = 0

            assert vg_height <= self.num_of_cores, ("Virtual gang <h=%d> "
                    "does not fit in the core count <%d>" % (vg_height,
                        self.num_of_cores))

            for tid in vg_members:
                task = self.__get_task_by_tid(tid)
                expected_gang_length = max(task.c, expected_gang_length)
                expected_gang_demand += task.r
            expected_gang_demand = max(100, expected_gang_demand)

            assert expected_gang_demand == vg_demand, ("The expected resource "
                    "demand <%d> of the virtual-gang does not match the "
                    "calculated resource demand <%d>" % (expected_gang_demand,
                        vg_demand))

            expected_gang_length *= (expected_gang_demand / 100.0)
            delta_gang_length = abs(vg_length - expected_gang_length)

            assert delta_gang_length < self.tolerance, ("The delta in "
                    "expected virtual-gang length <%.3f> and the calculated "
                    "virtual-gang length <%.3f> is more than tolerance mergin "
                    "<%.3f>" % (expected_gang_length, vg_length,
                        self.tolerance))

        return

    def __verify_last_unsat_solution(self, script):
        # We are not verifying the last unsat solution
        if not self.verify:
            return True, 0

        unsat = False
        start = time()
        solution = self.smt.verify(script)
        duration = time() - start

        assert duration < self.max_timeout, ("Unsat solution was not computed "
                "within timeout <%d>" % self.max_timeout)

        if not solution:
            unsat = True

        return unsat, duration

    def __create_virtual_taskset(self, virtual_gangs, first_vtask_tid):
        virtual_taskset = []

        for vgid in virtual_gangs:
            vg_tid = first_vtask_tid + vgid
            vg_length = virtual_gangs[vgid]['C']
            vg_height = virtual_gangs[vgid]['h']
            vg_demand = virtual_gangs[vgid]['r']

            vTask = Task(vg_tid, vg_length, self.period, vg_height, vg_demand)
            virtual_taskset.append(vTask)

        return virtual_taskset

    def __print_vgangs(self, gdict):
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

    def __reorder_virtual_gangs(self, vgangs):
        ordered_gang_dict = {}
        gang_ids = sorted(vgangs.keys())

        vidx = 1
        for vgid in gang_ids:
            ordered_gang_dict[vidx] = vgangs[vgid]
            vidx += 1

        return ordered_gang_dict

    def __calc_vgang_height(self, members):
        height = 0
        for tid in members:
            task = self.__get_task_by_tid(tid)
            height += task.h

        return height

    def __update_gang_length(self, cur_length, prev_length, down):
        step = abs(cur_length - prev_length) / 2
        prev_length = cur_length
        cur_length = (cur_length - step) if down else (cur_length + step)

        return cur_length, prev_length

    def __clean_smt_output(self, output):
        intm_gangs = self.smt.parse(output)
        virtual_gangs = self.__stratify_intm_gangs(intm_gangs)
        ordered_virtual_gangs = self.__reorder_virtual_gangs(virtual_gangs)

        return ordered_virtual_gangs

    def __get_task_by_tid(self, tid):
        for t in self.candidate_set:
            if t.tid == tid:
                return t

        raise ValueError, "Task <t%d> not found in list: %s" % (tid,
                self.__candidate_set_to_string())

    def __print_candidate_set(self):
        print "\n============== Candidate Set =============="
        for t in self.candidate_set: print t
        print

        return

    def __print_time(self, string):
        if self.time: print string
        return

    def __get_first_tid(self):
        return self.candidate_set[0].tid - 1

    def __candidate_set_to_string(self):
        return ','.join(['t%d' % t.tid for t in self.candidate_set])
