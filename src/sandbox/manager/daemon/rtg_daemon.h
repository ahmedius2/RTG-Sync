#ifndef __RTG_DAEMON_H__
#define __RTG_DAEMON_H__

#include "../include/rtg_common.h"

static int rtg_log_level = 0;
static int handshake_sockfd;

#define RTG_CRITICAL		0
#define RTG_WARNING		1
#define RTG_STATUS		2
#define RTG_DEBUG		3

#define RTG_LOG(lvl, fmt, ...)					\
do {								\
	if (lvl <= rtg_log_level)				\
		printf (fmt, ##__VA_ARGS__);			\
} while (0);

#define RTG_CMD_IS(target)					\
	!strncmp (cmd, target, strlen (target))

static void setup_handshake_socket (void);
static int wait_for_handshake (void);
static char* wait_for_command (int session_sockfd);
static bool parse_command (char* cmd, int session_sockfd);
static void manage_session (int session_sockfd);

#endif /* __RTG_DAEMON_H__ */
