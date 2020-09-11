import math, sys, re
from taskFactory import Task

class RTA:
    def __init__(self, params):
        required_params = ['num_of_cores']
        self.allowed_schedulers = ['RT-Gang', 'RTG-Sync', 'h1-len-dsc',
                'h2-lnr-hyb', 'h3-crt-pth']

        for rp in required_params:
            assert params.has_key(rp), ("%s is a required parameter "
                    "for RTA class" % (rp))

            setattr(self, rp, params[rp])

        return

    def run(self, taskset, scheduler, debug = False):
        pq = []
        self.__check_scheduler(scheduler)

        if scheduler in ['h1-len-dsc', 'h2-lnr-hyb', 'h3-crt-pth']:

            if scheduler == 'h2-lnr-hyb':
                # print
                self.__form_virtual_gangs_heuristic_h2(taskset, scheduler, False)
                # print

            if scheduler == 'h3-crt-pth':
                # print
                self.__form_virtual_gangs_heuristic_h3(taskset, scheduler, True)
                # print

            if scheduler == 'h1-len-dsc':
                self.__form_virtual_gangs_heuristic_h1(taskset, scheduler, debug)

            # for p in taskset:
            #     print '-' * 30, 'Period: %d' % (p), '-' * 30
            #     print '  - Candidate Set:'
            #     print '\n'.join(['    + ' + t.__str__() for t in taskset[p]['Real']])
            #     print
            #     print '  - Heuristic Set:'
            #     print '\n'.join(['    + ' + t.__str__() for t in taskset[p][scheduler]])
            #     print

            #     print "[DEBUG] Virtual Set:"
            #     self.__print_pq(taskset[p]['Virtual'])

            #     print "\n[DEBUG] Heuristic Set:"
            #     self.__print_pq(taskset[p]['RTG-Sync-H1'])
            #     print "\n" + "-" * 50 + "\n"

        if scheduler in ['RT-Gang', 'RTG-Sync', 'h1-len-dsc', 'h2-lnr-hyb']:
            pq, sched_test_1 = self.__create_rtg_pq(taskset, scheduler)

            # Taskset has failed the preliminary schedulability test
            if not sched_test_1:
                return 0

            # Taskset passed first schedulability test; apply full RTA
            idx = 1
            for tau in pq[1:]:
                hp_tasks = pq[:idx]
                schedulable, response_time = self.__check_schedulability(tau,
                        hp_tasks)

                if not schedulable:
                    return 0

                idx += 1

        return 1

    def __form_virtual_gangs_heuristic_h3(self, taskset, heuristic,
            debug = False):
        vIdx = sum([len(taskset[p]['Real']) for p in taskset])+ 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

            # if debug:
            #     print "[DEBUG]<%s> Candidate Set:" % (heuristic)
            #     self.__print_pq(candidate_set)

            pq, graph = self.__create_heuristic_pq(candidate_set, heuristic)

            if debug:
                print "[DEBUG]<%s> PQ:" % (heuristic)
                self.__print_pq(pq)

            while len(pq) != 0:
                tk = pq.pop(0)
                sweep_list = []
                candidate_list = []

                if debug:
                    print '-' * 50
                    print 'tk: %s' % (tk)

                for tj in pq:
                    if debug: print 'tj: %s' % (tj)
                    if tk.h + tj.h > self.num_of_cores:
                        continue

                    if self.__are_related(tk, tj, graph):
                        continue

                    candidate_list.append(tj)

                if debug:
                    print 'Candidates:'
                    print '\n'.join(['  + ' + t.__str__() for t in candidate_list])

                candidate_list = self.__score_candidates(tk, candidate_list)

                if debug:
                    print 'Ranked Candidates:'
                    print '\n'.join(['  + ' + t.__str__() for t in candidate_list])

                while len(candidate_list) != 0:
                    tc = self.__get_best_corunner(tk, candidate_list, graph)

                    if debug: print '    * Pairing: %s' % (tc)
                    sweep_list.append(tc)
                    tk = self.__create_virtual_task(tk, tc, vIdx, graph)
                    if debug: print '    * Vgang: %s' % (tk)

                    # We cannot pair any more tasks with ti
                    if tk.h == self.num_of_cores:
                        break

                if tk.members == '':
                    tk.members = 't%d' % (tk.tid)

                self.__scale_virtual_task(tk)
                virtual_taskset.append(tk)
                vIdx += 1

                # Remove paired tasks from pq
                for tx in sweep_list:
                    pq.remove(tx)

            if debug:
                print "\n[DEBUG] Virtual Set:"
                self.__print_pq(virtual_taskset)
                print "\nLength = %.2f" % (sum([t.c for t in virtual_taskset]))
                print '\n', "-" * 78, '\n'

            taskset[period][heuristic] = virtual_taskset

        return

    def __form_virtual_gangs_heuristic_h2(self, taskset, heuristic,
            debug = False):
        vIdx = sum([len(taskset[p]['Real']) for p in taskset])+ 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

            # if debug:
            #     print "[DEBUG]<%s> Candidate Set:" % (heuristic)
            #     self.__print_pq(candidate_set)

            pq, graph = self.__create_heuristic_pq(candidate_set, heuristic)

            if debug:
                print "[DEBUG]<%s> PQ:" % (heuristic)
                self.__print_pq(pq)

            while len(pq) != 0:
                tk = pq.pop(0)
                sweep_list = []
                candidate_list = []

                if debug:
                    print '-' * 50
                    print 'tk: %s' % (tk)

                for tj in pq:
                    if debug: print 'tj: %s' % (tj)
                    if tk.h + tj.h > self.num_of_cores:
                        continue

                    if self.__are_related(tk, tj, graph):
                        continue

                    candidate_list.append(tj)

                if debug:
                    print 'Candidates:'
                    print '\n'.join(['  + ' + t.__str__() for t in candidate_list])

                candidate_list = self.__score_candidates(tk, candidate_list)

                if debug:
                    print 'Ranked Candidates:'
                    print '\n'.join(['  + ' + t.__str__() for t in candidate_list])

                while len(candidate_list) != 0:
                    tc = self.__get_best_corunner(tk, candidate_list, graph)

                    if debug: print '    * Pairing: %s' % (tc)
                    sweep_list.append(tc)
                    tk = self.__create_virtual_task(tk, tc, vIdx, graph)
                    if debug: print '    * Vgang: %s' % (tk)

                    # We cannot pair any more tasks with ti
                    if tk.h == self.num_of_cores:
                        break

                if tk.members == '':
                    tk.members = 't%d' % (tk.tid)

                self.__scale_virtual_task(tk)
                virtual_taskset.append(tk)
                vIdx += 1

                # Remove paired tasks from pq
                for tx in sweep_list:
                    pq.remove(tx)

            if debug:
                print "\n[DEBUG] Virtual Set:"
                self.__print_pq(virtual_taskset)
                print "\nLength = %.2f" % (sum([t.c for t in virtual_taskset]))
                print '\n', "-" * 78, '\n'

            taskset[period][heuristic] = virtual_taskset

        return

    def __get_best_corunner(self, tk, candidate_list, graph):
        tc = candidate_list[0]

        rem_cores = self.num_of_cores - tk.h - tc.h

        assert rem_cores >= 0, ('-ve remaining cores <%d> after gang '
                'formation. \n  - tk: %s\n  - tc: %s' % (rem_cores, tk, tc))

        candidate_list.remove(tc)

        tmp_candidate_list = [tx for tx in candidate_list]
        for tx in tmp_candidate_list:
            if tx.h > rem_cores:
                candidate_list.remove(tx)
                continue

            if self.__are_related(tc, tx, graph):
                candidate_list.remove(tx)

        return tc

    def __score_candidates_path(self, tk, candidate_list):
        score_hash = {}

        for tc in candidate_list:
            # Assume that we pair tc with tk and evaluate the resulting vgang
            vg_demand = tc.r + tk.r

            vg_scaled_length = tk.c * max(1.0, vg_demand / 100.0)
            score = vg_scaled_length - tc.c

            while score in score_hash:
                score += 1

            score_hash[score] = tc

        sorted_scores = sorted(score_hash.keys())
        scored_candidate_list = [score_hash[sc] for sc in sorted_scores]

        return scored_candidate_list

    def __score_candidates(self, tk, candidate_list):
        score_hash = {}

        for tc in candidate_list:
            # Assume that we pair tc with tk and evaluate the resulting vgang
            vg_demand = tc.r + tk.r

            vg_scaled_length = tk.c * max(1.0, vg_demand / 100.0)
            score = vg_scaled_length - tc.c

            while score in score_hash:
                score += 1

            score_hash[score] = tc

        sorted_scores = sorted(score_hash.keys())
        scored_candidate_list = [score_hash[sc] for sc in sorted_scores]

        return scored_candidate_list

    def __form_virtual_gangs_heuristic_h1(self, taskset, heuristic,
            debug = False):
        vIdx = sum([len(taskset[p]['Real']) for p in taskset])+ 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

            # if debug:
            #     print "[DEBUG]<%s> Candidate Set:" % (heuristic)
            #     self.__print_pq(candidate_set)

            pq, graph = self.__create_heuristic_pq(candidate_set, heuristic)

            if debug:
                print "[DEBUG]<%s> PQ:" % (heuristic)
                self.__print_pq(pq)

            while len(pq) != 0:
                tk = pq.pop(0)
                sweep_list = []

                for tj in pq:
                    if tk.h + tj.h > self.num_of_cores:
                        continue

                    if debug:
                        print '=' * 50
                        print '  - ti:', tk
                        print '  - tj:', tj
                    if self.__are_related(tk, tj, graph, debug):
                        if debug:
                            print '  - ti=%d and tj=%d are related!' % (tk.tid,
                                    tj.tid)

                        continue

                    sweep_list.append(tj)
                    tk = self.__create_virtual_task(tk, tj, vIdx, graph)

                    # We cannot pair any more tasks with ti
                    if tk.h == self.num_of_cores:
                        break

                if tk.members == '':
                    tk.members = 't%d' % (tk.tid)

                self.__scale_virtual_task(tk)
                virtual_taskset.append(tk)
                vIdx += 1

                # Remove paired tasks from pq
                for tx in sweep_list:
                    pq.remove(tx)

            if debug:
                print "\n[DEBUG] Virtual Set:"
                self.__print_pq(virtual_taskset)
                print "\nLength = %.2f" % (sum([t.c for t in virtual_taskset]))
                print '\n', "-" * 78, '\n'

            taskset[period][heuristic] = virtual_taskset

        return

    def __scale_virtual_task(self, ti):
        ti.c *= max(1.0, ti.r / 100.0)
        return

    def __are_related(self, ti, tj, taskset, debug = False):
        if debug: print '*' * 50

        # ti_family = self.__get_family(ti.tid, taskset)
        tj_family = self.__get_family(tj.tid, taskset, debug)

        if debug:
            # print 'ti=%s' % (ti.tid), 'ti_family:', ti_family
            print 'tj=%s' % (tj.tid), 'tj_family:', tj_family
            print '\n'.join(['  + ' + t.__str__() for t in taskset])

        # common_members = [t for t in ti_family if t in tj_family]

        if ti.tid in tj_family: # or tj.tid in ti_family or common_members:
            return True

        return False

    def __get_member_list(self, ti):
        pattern = r't([\d]+)'
        members = [int(tid) for tid in re.findall(pattern, ti.members)]
        if not members: members = [ti.tid]

        return members

    def __get_family(self, tid, taskset, debug):
        if debug: print '  - get_family: %d' % (tid)
        family = self.__get_ancestors(tid, taskset)
        if debug: print '    + ancestors:', family
        family += self.__get_descendents(tid, taskset, debug)

        return list(set(family))

    def __get_ancestors(self, tid, taskset):
        if tid == 1:
            return []

        # tk is a predecessor of ti
        ancestors = self.__get_predecessors(tid, taskset)

        # tk is an ancestor of a predecessor of ti
        for t in ancestors:
            ancestors += self.__get_ancestors(t, taskset)

        return ancestors

    def __get_predecessors(self, tid, taskset):
        predecessors = []

        for t in taskset:
            if tid not in t.e:
                continue

            predecessors.append(t.tid)

        return predecessors

    def __get_descendents(self, tid, taskset, debug = False):
        descendents = []
        t = self.__get_task_by_tid(tid, taskset)

        if debug: print '      * get_descendents: %d | <' % (tid), t, '>'
        assert t != None, ("Tid <%s> not found in taskset" % tid)

        for tid in t.e:
            descendents.append(tid)
            descendents += self.__get_descendents(tid, taskset, debug)

        return descendents

    def __get_task_by_tid(self, tid, taskset):
        for t in taskset:
            if t.tid == tid:
                return t

        return None

    def __create_virtual_task(self, ti, tj, vIdx, graph):
        virt_c = max(ti.c, tj.c)
        virt_r = ti.r + tj.r
        virt_h = ti.h + tj.h
        virt_e = list(set(ti.e + tj.e))
        virt_p = ti.p

        ti_ancestors = self.__get_predecessors(ti.tid, graph)
        tj_ancestors = self.__get_predecessors(tj.tid, graph)

        for tx in ti_ancestors:
            Tx = self.__get_task_by_tid(tx, graph)
            Tx.e.remove(ti.tid)
            Tx.e.append(vIdx)

        for tx in tj_ancestors:
            Tx = self.__get_task_by_tid(tx, graph)
            Tx.e.remove(tj.tid)
            Tx.e.append(vIdx)

        virt_members = ''
        if ti.members == '':
            if tj.members == '':
                virt_members = 't%d+t%d' % (ti.tid, tj.tid)
            else:
                virt_members = 't%d+%s' % (ti.tid, tj.members)
        else:
            if tj.members == '':
                virt_members = '%s+t%d' % (ti.members, tj.tid)
            else:
                virt_members = '%s+%s' % (ti.members, tj.members)

        vTask = Task(vIdx, virt_c, virt_p, virt_h, virt_r, virt_e, virt_members)

        graph.remove(ti)
        graph.remove(tj)
        graph.append(vTask)

        return vTask

    def __create_heuristic_pq(self, candidate_set, heuristic):
        pq = []
        graph = []

        for ti in candidate_set:
            idx = 0

            # Find appropriate location in pq for adding this task
            for tj in pq:
                if self.__sort(ti, tj, heuristic):
                    idx += 1
                    continue

                break

            tx = ti.copy()
            pq.insert(idx, tx)
            graph.insert(idx, tx)

        return pq, graph

    def __sort(self, ti, tj, heuristic):
        try:
            if heuristic in ['h1-len-dsc', 'h2-lnr-hyb']:
                # Higher 'C', higher priority
                return ti.c <= tj.c
            else:
                raise ValueError, ('Heuristic <%s> not registered' %
                        (heuristic))
        except:
            raise ValueError, ('Invalid task(s)!\n  ti: %s\n  tj: %s' %
                    (ti, tj))


    def __create_rtg_pq(self, taskset, scheduler):
        pq = []
        sorted_periods = sorted(taskset.keys())

        super_tid = 1
        for p in sorted_periods:
            if scheduler == 'RT-Gang':
                tasks = taskset[p]['Real']
            elif scheduler == 'RTG-Sync':
                tasks = taskset[p]['Virtual']
            elif scheduler in ['h1-len-dsc', 'h2-lnr-hyb']:
                tasks = taskset[p][scheduler]
            else:
                raise ValueError, ('Unknown scheduler: %s' % scheduler)

            super_c = sum([t.c for t in tasks])
            super_h = self.num_of_cores
            super_p = tasks[0].p
            super_r = 100

            if super_c > super_p:
                return [], False

            super_task = Task(super_tid, super_c, super_p, super_h, super_r)

            pq.append(super_task)
            super_tid += 1

        return pq, True

    def __check_schedulability(self, tk, hp_tasks):
        '''
            r_new = tk.c + sum_over_t_in_hp [(ceil (r_prev / period_of_t))
                                * t.c]
        '''
        schedulable = False
        rk_prev = tk.c

        while (1):
            interferenceFactor = \
                sum ([math.ceil (rk_prev / ti.p) * ti.c for ti in hp_tasks])
            rk_new = tk.c + interferenceFactor

            if rk_new == rk_prev or rk_new >= tk.p:
                if rk_new == rk_prev:
                    schedulable = True
                break
            rk_prev = rk_new

        return schedulable, rk_new

    def __check_scheduler(self, scheduler):
        assert scheduler in self.allowed_schedulers, ("Desired algorithm <%s> "
                "is not supported by RTA class: <%s>" % (scheduler,
                    ','.join(self.allowed_schedulers)))

        return

    def __print_pq(self, pq):
        for t in pq: print t

        return
