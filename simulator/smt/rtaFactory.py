import math, sys, re
from taskFactory import Task

class RTA:
    def __init__(self, params):
        required_params = ['num_of_cores']
        self.allowed_schedulers = ['RT-Gang', 'RTG-Sync', 'RTG-Sync-H1',
                'RTG-Sync-H2a', 'RTG-Sync-H2b', 'RTG-Sync-H3a',
                'RTG-Sync-H3b', 'RTG-Sync-Hx']

        for rp in required_params:
            assert params.has_key(rp), ("%s is a required parameter "
                    "for RTA class" % (rp))

            setattr(self, rp, params[rp])

        return

    def run(self, taskset, scheduler):
        pq = []
        self.__check_scheduler(scheduler)

        if scheduler in ['RTG-Sync-H1', 'RTG-Sync-H2a', 'RTG-Sync-H2b',
                'RTG-Sync-H3a', 'RTG-Sync-H3b', 'RTG-Sync-Hx']:
            self.__form_virtual_gangs_heuristic(taskset, scheduler)

            # for p in taskset:
            #     print "[DEBUG] Virtual Set:"
            #     self.__print_pq(taskset[p]['Virtual'])

            #     print "\n[DEBUG] Heuristic Set:"
            #     self.__print_pq(taskset[p]['RTG-Sync-H1'])
            #     print "\n" + "-" * 50 + "\n"

        if scheduler in ['RT-Gang', 'RTG-Sync', 'RTG-Sync-H1',
                'RTG-Sync-H2a', 'RTG-Sync-H2b', 'RTG-Sync-H3a',
                'RTG-Sync-H3b', 'RTG-Sync-Hx']:
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

    def __form_virtual_gangs_heuristic(self, taskset, heuristic):
        vIdx = 1

        for period in taskset:
            virtual_taskset = []
            candidate_set = taskset[period]['Real']

            # print "[DEBUG] Candidate Set:"
            # self.__print_pq(candidate_set)

            pq = self.__create_heuristic_pq(candidate_set, heuristic)

            while len(pq) != 0:
                ti = pq.pop(0)
                tk = ti.copy()
                sweep_list = []

                for tj in pq:
                    if tk.h + tj.h > self.num_of_cores:
                        continue

                    if self.__are_related(tk, tj, candidate_set):
                        continue

                    sweep_list.append(tj)
                    tk = self.__create_virtual_task(tk, tj, vIdx)

                    # We cannot pair any more tasks with ti
                    if tk.h == self.num_of_cores:
                        break

                if tk.members == '': tk.members = 't%d' % (tk.tid)

                tk.e = []
                tk.tid = vIdx

                self.__scale_virtual_task(tk)
                virtual_taskset.append(tk)
                vIdx += 1

                # Remove paired tasks from pq
                for tx in sweep_list:
                    pq.remove(tx)

            # print "\n[DEBUG] Virtual Set:"
            # self.__print_pq(virtual_taskset)
            # print '\n', "-" * 78, '\n'
            taskset[period][heuristic] = virtual_taskset

        return

    def __scale_virtual_task(self, ti):
        ti.c *= max(1.0, ti.r / 100.0)
        return

    def __are_related(self, ti, tj, taskset):
        # tj is always a 'real' task but ti can be virtual
        ti_family = []
        ti_members = self.__get_member_list(ti)

        for tx in ti_members:
            ti_family += self.__get_family(tx, taskset)

        tj_family = self.__get_family(tj.tid, taskset)
        ti_members_in_tj_family = [t for t in ti_members if t in tj_family]

        if ti_members_in_tj_family or tj.tid in ti_family:
            return True

        return False

    def __get_member_list(self, ti):
        pattern = r't([\d]+)'
        members = [int(tid) for tid in re.findall(pattern, ti.members)]
        if not members: members = [ti.tid]

        return members

    def __get_family(self, tid, taskset):
        family = []
        t = self.__get_task_by_tid(tid, taskset)

        assert t != None, ("Tid <%s> not found in taskset" % tid)

        for tid in t.e:
            family.append(tid)
            family += self.__get_family(tid, taskset)

        return family

    def __get_task_by_tid(self, tid, taskset):
        for t in taskset:
            if t.tid == tid:
                return t

    def __create_virtual_task(self, ti, tj, vIdx):
        virt_c = max(ti.c, tj.c)
        virt_r = ti.r + tj.r
        virt_h = ti.h + tj.h
        virt_e = list(set(ti.e + tj.e))
        virt_p = ti.p

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

        return Task(vIdx, virt_c, virt_p, virt_h, virt_r, virt_e, virt_members)


    def __create_heuristic_pq(self, candidate_set, heuristic):
        pq = []

        for ti in candidate_set:
            idx = 0

            # Find appropriate location in pq for adding this task
            for tj in pq:
                if self.__sort(ti, tj, heuristic):
                    idx += 1
                    continue

                break

            pq.insert(idx, ti)

        return pq

    def __sort(self, ti, tj, heuristic):
        if heuristic == 'RTG-Sync-H1':
            # Higher 'C', higher priority
            return ti.c <= tj.c
        elif heuristic == 'RTG-Sync-H2a':
            # Higher 'h', higher priority
            return ti.h >= tj.h
        elif heuristic == 'RTG-Sync-H2b':
            # Lower 'h', higher priority
            return ti.h <= tj.h
        elif heuristic == 'RTG-Sync-H3a':
            # Higher 'cost', higher priority
            return (ti.c / ti.h) >= (ti.c / ti.h)
        elif heuristic == 'RTG-Sync-H3b':
            # Lower 'cost', higher priority
            return (ti.c / ti.h) <= (ti.c / ti.h)
        elif heuristic == 'RTG-Sync-Hx':
            # Higher 'weighted-length', higher priority
            return (ti.c / (ti.r * ti.h)) <= (ti.c / (ti.r * ti.h))
        else:
            raise ValueError, ('Heuristic <%s> not registered' % (heuristic))


    def __create_rtg_pq(self, taskset, scheduler):
        pq = []
        sorted_periods = sorted(taskset.keys())

        super_tid = 1
        for p in sorted_periods:
            if scheduler == 'RT-Gang':
                tasks = taskset[p]['Real']
            elif scheduler == 'RTG-Sync':
                tasks = taskset[p]['Virtual']
            elif scheduler == 'RTG-Sync-H1':
                tasks = taskset[p]['RTG-Sync-H1']
            elif scheduler == 'RTG-Sync-H2a':
                tasks = taskset[p]['RTG-Sync-H2a']
            elif scheduler == 'RTG-Sync-H2b':
                tasks = taskset[p]['RTG-Sync-H2b']
            elif scheduler == 'RTG-Sync-H3a':
                tasks = taskset[p]['RTG-Sync-H3a']
            elif scheduler == 'RTG-Sync-H3b':
                tasks = taskset[p]['RTG-Sync-H3b']
            elif scheduler == 'RTG-Sync-Hx':
                tasks = taskset[p]['RTG-Sync-Hx']
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
        assert scheduler in self.allowed_schedulers, ("Desired scheduler <%s> "
                "is not supported by RTA class: <%s>" % (scheduler,
                    ','.join(self.allowed_schedulers)))

        return

    def __print_pq(self, pq):
        for t in pq: print t

        return
