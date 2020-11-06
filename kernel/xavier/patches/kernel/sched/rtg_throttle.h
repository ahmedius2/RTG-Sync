#ifndef __RTG_THROTTLE_H__
#define __RTG_THROTTLE_H__

#if defined(CONFIG_SCHED_RTGANG) && defined(CONFIG_SCHED_THROTTLE)

#define ID_TX2				(0x1)
#define ID_PI				(0x2)
#define PLATFORM_ID			ID_TX2

#if (PLATFORM_ID == ID_TX2 || PLATFORM_ID == ID_PI)
#define TH_RTG_EVT1_ID			(0x17)
#define TH_RTG_EVT2_ID			(0x18)
#else
#error Platform not supported by throttling framework.
#endif

#define TH_RTG_EVT1_DEFAULT_BUDGET	(16348LLU)    /* 1000 MBps */
#define TH_RTG_EVT2_DEFAULT_BUDGET	(8192LLU)     /* 500  MBps */
#define TH_RTG_EVT1_MAX_BUDGET		(1634800LLU)  /* 100  GBps */
#define TH_RTG_EVT2_MAX_BUDGET		(819200LLU)   /* 50   GBps */

void th_rtg_create_event(int id, u64 budget);
void th_rtg_update_budget(u64 evt1_budget, u64 evt2_budget);

#endif /* defined(CONFIG_SCHED_RTGANG) && defined(CONFIG_SCHED_THROTTLE) */

#endif /* __RTG_THROTTLE_H__ */
