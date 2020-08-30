import math
from taskFactory import Task

class RTA:
    def __init__(self, params):
        required_params = ['num_of_cores']
        self.allowed_schedulers = ['RT-Gang', 'RTG-Sync']

        for rp in required_params:
            assert params.has_key(rp), ("%s is a required parameter "
                    "for RTA class" % (rp))

            setattr(self, rp, params[rp])

        return

    def run(self, taskset, scheduler):
        pq = []
        self.__check_scheduler(scheduler)

        if scheduler in ['RT-Gang', 'RTG-Sync']:
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

    def __create_rtg_pq(self, taskset, scheduler):
        pq = []
        sorted_periods = sorted(taskset.keys())

        super_tid = 1
        for p in sorted_periods:
            tasks = taskset[p]["Real"] if scheduler == 'RT-Gang' else \
                    taskset[p]["Virtual"]

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
