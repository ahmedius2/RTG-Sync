import os, sys
from taskFactory import Task

class H2:
    def __init__(self, params):
        required_params = ['num_of_cores']

        for rp in required_params:
            assert params.has_key(rp), ("%s is a required parameter "
                    "for Heuristic class" % (rp))

            setattr(self, rp, params[rp])

        return

    def run(self, candidate_set, result_dir, debug = False):
        result_dir = os.getcwd() + result_dir
        if not os.path.exists(result_dir):
            print '\n[ERROR] Result directory <%s> for storing ' \
                    'heuristic result does not exist.' % (result_dir)

            sys.exit()

        virtual_taskset = self.__form_virtual_gangs_h2(candidate_set, debug)
        result_file = result_dir + '/h2_virtual_taskset.txt'

        with open(result_file, 'w') as fdo:
            fdo.write('============= Heuristic Virtual Gangs ============\n')
            fdo.write('\n'.join(['%s' % t for t in virtual_taskset]))
            fdo.write('\n')

        return virtual_taskset

    def __create_pq(self, candidate_set):
        pq = []
        graph = []

        for ti in candidate_set:
            idx = 0

            # Find appropriate location in pq for adding this task
            for tj in pq:
                if self.__sort(ti, tj):
                    idx += 1
                    continue

                break

            tx = ti.copy()
            pq.insert(idx, tx)
            graph.insert(idx, tx)

        return pq, graph

    def __sort(self, ti, tj):
        return ti.c <= tj.c

    def __form_virtual_gangs_h2(self, candidate_set, debug = False):
        virtual_taskset = []
        vIdx = max([t.tid for t in candidate_set]) + 1

        pq, graph = self.__create_pq(candidate_set)

        if debug:
            print "[DEBUG] PQ:"
            print "\n".join([t.__str__() for t in pq])

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
            print "\n".join([t.__str__() for t in virtual_taskset])
            print "\nLength = %.2f" % (sum([t.c for t in virtual_taskset]))
            print '\n', "-" * 78, '\n'

        return virtual_taskset

    def __scale_virtual_task(self, ti):
        ti.c *= max(1.0, ti.r / 100.0)
        return

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
            if vIdx not in Tx.e: Tx.e.append(vIdx)

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
