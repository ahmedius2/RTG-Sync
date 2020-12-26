import math, os, sys, re
from taskFactory import Task
from combinationGenerator import CombinationGenerator

class RTA:
    def __init__(self, params):
        required_params = ['num_of_cores']
        self.allowed_schedulers = ['RT-Gang', 'RTG-Sync', 'RTG-Synci',
                'h1-len-dsc', 'h2-lnr-hyb', 'h3-crt-pth', 'h4-mlt-scr',
                'h5-lnr-hyb', 'h6-crt-pth', 'GFTP', 'GFTPi', 'Threaded',
                'Threadedi']

        for rp in required_params:
            assert params.has_key(rp), ("%s is a required parameter "
                    "for RTA class" % (rp))

            setattr(self, rp, params[rp])

        self.gang_factory = CombinationGenerator(self.num_of_cores)

        return

    def __calc_task_scaling_factor(self, task, corunners):
        worst_gang, max_demand = self.gang_factory.find_worst_corunner_gang(task, corunners)
        scaling_factor = max(1, max_demand / 100.0)

        return scaling_factor

    def __get_corunners_of_task (self, subject_task, taskset):
        corunner_taskset = []

        for p in taskset:
            for t in taskset[p]:
                if t == subject_task:
                    continue

                if (t.h + subject_task.h) <= self.num_of_cores:
                    corunner_taskset.append(t)

        return corunner_taskset

    def __scale_taskset(self, taskset):
        scaling_factors = {}

        for p in taskset:
            for t in taskset[p]:
                if t.h == self.num_of_cores:
                    # There cannot be any corunners of this task since it
                    # requires all the cores
                    scaling_factors[t] = 1.0
                    continue

                corunner_taskset = self.__get_corunners_of_task(t, taskset)

                if corunner_taskset != []:
                    scaling_factors[t] = self.__calc_task_scaling_factor(t, corunner_taskset)
                    continue

                scaling_factors[t] = 1.0

        for p in taskset:
            for t in taskset[p]:
                t.c *= scaling_factors[t]

        return taskset

    def __deep_copy_taskset(self, taskset):
        copied_taskset = {}

        for p in taskset:
            copied_taskset[p] = [t.copy() for t in taskset[p]['Real']]

        return copied_taskset

    def __check_schedulability_gftp(self, tk, hp_tasks):
        schedulable = False
        rk_prev = tk.c

        iIk = self.__calc_task_iIk(tk, hp_tasks)
        while (1):
            iWk = self.__calc_workload_iWk(rk_prev, hp_tasks)
            interferenceFactor = sum([iIk [ti] * iWk [ti] for ti in hp_tasks])
            rk_new = tk.c + math.floor(interferenceFactor)

            if rk_new == rk_prev or rk_new > tk.p:
                if rk_new == rk_prev:
                    schedulable = True
                break
            rk_prev = rk_new

        return schedulable, rk_new

    def __calc_workload_iWk(self, t, hp_tasks):
        iWk = {}
        for ti in hp_tasks:
            delta_i = ti.p - hp_tasks[ti] + ti.c

            if t <= delta_i:
                iWk[ti] = min(t, ti.c)
            else:
                iWk[ti] = ti.c + ti.c * \
                           math.floor(float(t - delta_i) / ti.p) + \
                           min(ti.c, (t - delta_i) % ti.p)

        return iWk

    def __calc_task_iIk(self, tk, hp_tasks):
        iIk = {}
        for ti in hp_tasks:
            iIk[ti] = float(min(ti.h, self.num_of_cores - tk.h + 1)) / \
                    (self.num_of_cores - tk.h + 1)

        return iIk

    def __get_gftp_scaled_taskset(self, taskset):
        gftp_taskset = {}

        for p in taskset:
            gftp_taskset[p] = [t.copy() for t in taskset[p]['GFTP']]

        return gftp_taskset

    def run(self, taskset, scheduler, gen_dir = '', debug = False):
        pq = []
        self.__check_scheduler(scheduler)

        if scheduler in ['h1-len-dsc', 'h2-lnr-hyb', 'h3-crt-pth',
                'h4-mlt-scr', 'h5-lnr-hyb', 'h6-crt-pth']:

            if scheduler == 'h1-len-dsc':
                self.__form_virtual_gangs_heuristic_h1(taskset, scheduler, debug)

            if scheduler == 'h2-lnr-hyb':
                self.__form_virtual_gangs_heuristic_h2(taskset, scheduler, debug)

            if scheduler == 'h3-crt-pth':
                self.__form_virtual_gangs_heuristic_h3(taskset, scheduler, debug)

            if scheduler == 'h4-mlt-scr':
                self.__form_virtual_gangs_heuristic_h4(taskset, scheduler, debug)

            if scheduler == 'h5-lnr-hyb':
                self.__form_virtual_gangs_heuristic_h5(taskset, scheduler, debug)

            if scheduler == 'h6-crt-pth':
                self.__form_virtual_gangs_heuristic_h6(taskset, scheduler, debug)

        if scheduler in ['GFTP', 'GFTPi', 'Threaded', 'Threadedi']:
            if scheduler == 'GFTP':
                taskset = self.__deep_copy_taskset(taskset)
                taskset = self.__scale_taskset(taskset)

                for p in taskset:
                    target_dir = gen_dir + str(p)
                    if debug:
                        print
                        print target_dir
                        print

                    assert os.path.exists(target_dir), ('Target folder <%s> '
                            'for GFTP does not exist.' % (target_dir))

                    gftp_file = target_dir + '/gftp.txt'
                    with open(gftp_file, 'w') as fdo:
                        fdo.write('======== Scaled GFTP Taskset =============\n')
                        fdo.write('\n'.join([t.__str__() for t in taskset[p]]))
                        fdo.write('\n')
            else:
                taskset = self.__deep_copy_taskset(taskset)

                if scheduler in ['Threaded', 'Threadedi']:
                    taskset = self.__split_gangs_into_threads(taskset)

                    if scheduler == 'Threaded':
                        taskset = self.__scale_threadset(taskset)

            periods = sorted(taskset.keys())
            hp_tasks = {}

            if debug:
                print '===== GFTP'
                print '  - Taskset:'

                for p in taskset:
                    print '    * Period=%d' % (p)
                    print '\n'.join(['      + %s' % t for t in taskset[p]])

            for p in periods:
                tasks = [t.copy() for t in taskset[p]]

                # Scheduling jobs of the same period - SJF policy
                keys = sorted(list(set([t.c for t in tasks])))
                pQueues = {k:[] for k in keys}

                # Populate priority-queues
                for k in keys:
                    for t in tasks:
                        if t.c == k:
                            pQueues[k].append(t)

                for k in keys:
                    for t in pQueues[k]:
                        schedulable, responseTime = self.__check_schedulability_gftp(t, hp_tasks)

                        if not schedulable:
                            if debug: print '  = Unschedulable!'
                            return 0

                        hp_tasks[t] = responseTime

            if debug: print '  = Schedulable!'
            return 1

        if scheduler in ['RT-Gang', 'RTG-Sync', 'RTG-Synci', 'h1-len-dsc',
                'h2-lnr-hyb', 'h3-crt-pth', 'h4-mlt-scr', 'h5-lnr-hyb',
                'h6-crt-pth']:
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

    def __scale_threadset (self, taskset):
        sorted_tasks = []
        scaling_factors = {}
        temp_taskset = [t for p in taskset for t in taskset[p]]
        sorted_resource_demands = list(set(sorted([t.r for t in temp_taskset], reverse = True)))

        for r in sorted_resource_demands:
            for t in temp_taskset:
                if t.r == r:
                    sorted_tasks.append(t)
                    temp_taskset.remove(t)

        for p in taskset:
            for t in taskset [p]:
                worst_corunners = sorted_tasks[:self.num_of_cores]

                if t in worst_corunners:
                    worst_corunners.remove(t)
                else:
                    del (worst_corunners[-1])

                max_demand = t.r + sum([w.r for w in worst_corunners])
                scaling_factors[t] = max(1, max_demand / 100.0)

        for p in taskset:
            for t in taskset[p]:
                t.c *= scaling_factors[t]

        return taskset

    def __split_gangs_into_threads(self, taskset):
        threadset = {}
        threadIdx = 1

        for p in taskset:
            threadset[p] = []
            for t in taskset [p]:
                for th in range(int(t.h)):
                    thread = Task(threadIdx, t.c, t.p, 1, t.r/t.h)
                    threadset[p].append(thread)
                    threadIdx += 1

        return threadset

    def __form_virtual_gangs_heuristic_h6(self, taskset, heuristic,
            debug = False):
        vIdx = sum([len(taskset[p]['Real']) for p in taskset])+ 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

            pq, graph = self.__create_heuristic_pq(candidate_set, heuristic)

            min_virt_gang = math.ceil(sum([t.h for t in candidate_set]) /
                    self.num_of_cores)

            max_tasks_paths = self.__calc_nodes_in_longest_path(graph)
            critical_length = int(max(min_virt_gang, max_tasks_paths))

            if debug:
                print "[DEBUG]<%s> PQ:" % (heuristic)
                self.__print_pq(pq)
                print "\n  * max_tasks_path: %d | critical_length: %d" % (
                        max_tasks_paths, critical_length)

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

                candidate_list = self.__score_candidates_path2(tk, candidate_list, graph, critical_length, debug)

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


    def __form_virtual_gangs_heuristic_h3(self, taskset, heuristic,
            debug = False):
        vIdx = sum([len(taskset[p]['Real']) for p in taskset])+ 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

            if debug:
                print "[DEBUG]<%s> Candidate Set:" % (heuristic)
                self.__print_pq(candidate_set)

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

                candidate_list = self.__score_candidates_path(tk, candidate_list, graph)

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

    def __form_virtual_gangs_heuristic_h4(self, taskset, heuristic,
            debug = False):
        vIdx = sum([len(taskset[p]['Real']) for p in taskset])+ 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

            num_cores = sum([t.h for t in candidate_set])
            total_r = sum([t.r for t in candidate_set])
            avg_r_core = total_r / float(num_cores)

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

                candidate_list = self.__score_candidates_h4(tk, candidate_list, avg_r_core, debug)

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

    def __form_virtual_gangs_heuristic_h5(self, taskset, heuristic,
            debug = False):
        vIdx = sum([len(taskset[p]['Real']) for p in taskset])+ 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

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

                candidate_list = self.__score_candidates_h5(tk, candidate_list)

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

    def __calc_nodes_in_longest_path(self, graph):
        x = 0
        path = []

        # Find out all the source nodes in this graph
        sources = []
        for node in graph:
            predecessors = self.__get_predecessors(node.tid, graph)

            if predecessors == []:
                sources.append(node)

        for s in sources:
            sub_path = self.__calc_longest_path_from_source(s, graph)
            sub_path_len = len(sub_path)

            if sub_path_len > x:
                path = sub_path
                x = sub_path_len

        return x

    def __calc_paths_longer_than_crit_len(self, graph, crit_len, debug = False):
        paths = []

        # Find out all the source nodes in this graph
        sources = []
        for node in graph:
            predecessors = self.__get_predecessors(node.tid, graph)

            if predecessors == []:
                sources.append(node)

        for s in sources:
            path = self.__calc_longest_path_from_source(s, graph)
            path_len = len(path)

            if path_len > crit_len:
                paths.append(path)

        return paths

    def __calc_longest_path_from_source(self, s, graph):
        path = []
        max_nodes_path = []
        max_nodes_path_len = 0

        for vidx in s.e:
            node = self.__get_task_by_tid(vidx, graph)
            sub_path = self.__calc_longest_path_from_source(node, graph)
            sub_path_len = len(sub_path)

            if sub_path_len > max_nodes_path_len:
                max_nodes_path = sub_path
                max_nodes_path_len = sub_path_len

        path = [s] + max_nodes_path

        return path

    def __score_candidates_path2(self, tk, candidate_list, graph,
            critical_length, debug = False):
        score_hash = {}

        for tp in candidate_list:
            # Create a tmp graph containing replicas of the tasks
            tmp_graph = [t.copy() for t in graph]
            tmp_vidx  = max([t.tid for t in tmp_graph]) + 1
            tk_copy = [t for t in tmp_graph if t.tid == tk.tid][0]
            tp_copy =  [t for t in tmp_graph if t.tid == tp.tid][0]

            tmp_gang = self.__tmp_create_virtual_task(tk_copy, tp_copy, tmp_vidx, tmp_graph)
            paths = self.__calc_paths_longer_than_crit_len(tmp_graph, critical_length, debug)

            penalty = self.__calc_penalty(paths, critical_length)
            score = tp.c - penalty

            while score in score_hash:
                score -= 0.001

            score_hash[score] = tp

        sorted_scores = sorted(score_hash.keys(), reverse = True)
        scored_candidate_list = [score_hash[sc] for sc in sorted_scores]

        if debug:
            if candidate_list != []:
                print '    - Scores:'

                for sc in sorted_scores:
                    print '      + %.2f | %s' % (sc, score_hash[sc])
            else:
                print '    - No candidates!'

        return scored_candidate_list

    def __calc_penalty(self, paths, critical_length):
        penalty = 0

        for p in paths:
            last_node_idx = len(p) - 1
            x = len(p) - critical_length

            assert x >= 0, ('Path is shorter than critical length <%d>: \n%s' %
                    (critical_length, '\n'.join(['  + %s' % t for t in path])))

            # xa = x
            min_possible_len_this_path = sum([t.c for t in p[:x]])

            for xa in range(0, x):
                xb = x - xa

                left_len = 0
                right_len = 0

                # xa nodes from beginning of p
                for node in p[:xa]:
                    left_len += node.c

                # xb nodes from end of p
                if xb != 0:
                    for node in p[-xb:]:
                        right_len += node.c

                path_len = left_len + right_len

                if path_len < min_possible_len_this_path:
                    min_possible_len_this_path = path_len

            if min_possible_len_this_path > penalty:
                penalty = min_possible_len_this_path

        return penalty

    def __score_candidates_path(self, tk, candidate_list, graph):
        score_hash = {}

        for tc in candidate_list:
            # Create a tmp graph containing replicas of the tasks
            tmp_graph = [t.copy() for t in graph]
            tmp_vidx  = max([t.tid for t in tmp_graph]) + 1
            tk_copy = [t for t in tmp_graph if t.tid == tk.tid][0]
            tc_copy =  [t for t in tmp_graph if t.tid == tc.tid][0]

            tmp_gang = self.__tmp_create_virtual_task(tk_copy, tc_copy, tmp_vidx, tmp_graph)
            score = self.__calc_crit_path(tmp_gang, tmp_graph)

            while score in score_hash:
                score += 1

            score_hash[score] = tc

        sorted_scores = sorted(score_hash.keys())

        scored_candidate_list = [score_hash[sc] for sc in sorted_scores]

        return scored_candidate_list

    def __calc_crit_path(self, node, graph):
        '''
          Calculate the length of the 'critical' path for 'node'.
          i.e., the longest path through the graph containing 'node'.
        '''

        left_path = self.__calc_left_crit_path(node, graph, True)
        right_path = self.__calc_right_crit_path(node, graph, True)
        crit_path_len = node.c +  left_path + right_path

        return crit_path_len

    def __calc_left_crit_path(self, node, graph, first = False):
        max_path_length = 0
        predecessors = self.__get_predecessors(node.tid, graph)

        for p in predecessors:
            pt = self.__get_task_by_tid(p, graph)
            length = self.__calc_left_crit_path(pt, graph)

            if length > max_path_length:
                max_path_length = length

        if not first:
            max_path_length += node.c

        return max_path_length

    def __calc_right_crit_path(self, node, graph, first = False):
        max_path_length = 0
        successors = node.e

        for s in successors:
            st = self.__get_task_by_tid(s, graph)
            length = self.__calc_right_crit_path(st, graph)

            if length > max_path_length:
                max_path_length = length

        if not first:
            max_path_length += node.c

        return max_path_length

    def __score_candidates_h4(self, tk, candidate_list, avg_r_core, debug = False):
        alpha = 1.0
        score_hash = {}

        for tp in candidate_list:
            penalty = abs((tk.r + tp.r) / (tk.h + tp.h) - avg_r_core) / float(avg_r_core)
            score = tp.c / (1 + penalty * alpha)

            while score in score_hash:
                score -= 0.0001

            score_hash[score] = tp

        sorted_scores = sorted(score_hash.keys(), reverse = True)
        scored_candidate_list = [score_hash[sc] for sc in sorted_scores]

        if debug:
            print '    - avg_r_core=%.2f' % (avg_r_core)
            print '    - Scores:'

            for sc in sorted_scores:
                print '      + %.2f | %s' % (sc, score_hash[sc])

        return scored_candidate_list

    def __score_candidates_h5(self, tk, candidate_list, debug = False):
        alpha = 2.00
        score_hash = {}

        for tc in candidate_list:
            penalty = tc.r / 100.0
            score = tc.c / (1 + penalty * alpha)

            while score in score_hash:
                score -= 0.001

            score_hash[score] = tc

        sorted_scores = sorted(score_hash.keys(), reverse = True)
        scored_candidate_list = [score_hash[sc] for sc in sorted_scores]

        if debug:
            if candidate_list != []:
                print '    - Scores:'

                for sc in sorted_scores:
                    print '      + %.2f | %s' % (sc, score_hash[sc])
            else:
                print '    - No candidates!'

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

        tj_family = self.__get_family(tj.tid, taskset, debug)

        if debug:
            print 'tj=%s' % (tj.tid), 'tj_family:', tj_family
            print '\n'.join(['  + ' + t.__str__() for t in taskset])

        if ti.tid in tj_family:
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

    def __tmp_create_virtual_task(self, ti, tj, vIdx, graph):
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

        # virt_c = virt_c * max(1, virt_r / 100.0) - (tj.c * tj.h)
        virt_c = virt_c * max(1, virt_r / 100.0)
        vTask = Task(vIdx, virt_c, virt_p, virt_h, virt_r, virt_e, virt_members)

        graph.remove(ti)
        graph.remove(tj)
        graph.append(vTask)

        return vTask

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
            if heuristic in ['h1-len-dsc', 'h2-lnr-hyb', 'h3-crt-pth',
                    'h4-mlt-scr', 'h5-lnr-hyb', 'h6-crt-pth']:
                # Higher 'C', higher priority
                return ti.c <= tj.c

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
            elif scheduler in ['RTG-Synci', 'h1-len-dsc', 'h2-lnr-hyb',
                    'h3-crt-pth', 'h4-mlt-scr', 'h5-lnr-hyb', 'h6-crt-pth']:
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
