#ifndef __RTGANG_H__
#define __RTGANG_H__

#ifdef CONFIG_SCHED_RTGANG

#define RTG_FIFO_PRIO_THRESHOLD		(50)
#define	RTG_CONTINUE			(0)
#define RTG_BLOCK			(1)

#define RTG_FIFO_CHECK(p)					\
	(p->mm && p->prio > RTG_FIFO_PRIO_THRESHOLD)

#define IS_REAL_GANG_MEMBER(p)					\
	(rtg_lock->leader->tgid == p->tgid)

#define IS_VIRT_GANG_MEMBER(p)					\
	((GET_RTG_INFO(rtg_lock->leader)->gid != 0) && 		\
		(GET_RTG_INFO(rtg_lock->leader)->gid == GET_RTG_INFO(p)->gid))

#define IS_GANG_MEMBER(p)					\
	(IS_REAL_GANG_MEMBER(p) || IS_VIRT_GANG_MEMBER(p))

#define IS_SAME_CLASS(p, n)					\
	(p->sched_class == n->sched_class)

#define IS_RTC(p)						\
	(p->sched_class == &rt_sched_class)

#define IS_EDF(p)						\
	(p->sched_class == &dl_sched_class)

#define IS_EARLIER_EDF(p, n)					\
	(dl_time_before(p->dl.deadline, n->dl.deadline))

#define IS_HIGHER_PRIO(p, n)					\
	(p->prio < n->prio)

#define PRINT_SCHED(p)						\
	(IS_EDF(p)? "EDF":"FIFO")

#define PRINT_PRIO(p)						\
	(IS_EDF(p)? p->dl.deadline:(u64)p->prio)

#undef RTG_DEBUG
#ifdef RTG_DEBUG
#define rtg_log_event(level, task, event)			\
do {								\
	rtg_debug(level, "rtg_%s: comm=%s rtgid=%d tgid=%d "    \
			"pid=%d prio=%d\n", event, task->comm, 	\
			task->rtgid, task->tgid, task->pid,	\
			task->prio);				\
} while (0);

#define rtg_debug(level, format, ...)				\
do {								\
	if (rtg_debug_level >= level)				\
		trace_printk(format, ##__VA_ARGS__);		\
} while (0);
#else
#define rtg_log_event(level, task, event)
#define rtg_debug(level, format, ...)
#endif

/* Debug Levels */
#define	RTG_LEVEL_DISABLE		(0)
#define RTG_LEVEL_STATE			(1)
#define RTG_LEVEL_SUBSTATE		(2)
#define RTG_LEVEL_ALL			(3)

struct rtgang_lock {
	bool			busy;
	raw_spinlock_t		access_lock;
	struct task_struct*	leader;
	struct task_struct*	gthreads [NR_CPUS];
	cpumask_var_t		locked_cores;
	cpumask_var_t		blocked_cores;
};

void rtg_try_release_lock(struct task_struct *prev);
int rtg_try_acquire_lock(struct task_struct *next);

#endif /* CONFIG_SCHED_RTGANG */

#endif /* __RTGANG_H__ */
