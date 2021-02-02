#ifndef __RTG_COMMON_H__
#define __RTG_COMMON_H__

#include <stdio.h>
#include <ctype.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/un.h>
#include <stdbool.h>
#include <sys/socket.h>

#include "rtg_sync_framework/rtg_lib.h"

#define QSIZE 			5
#define BSIZE			256
#define SOCKET_ADDRESS		"/tmp/rtg.sock"

#define RTG_END_SESSION		"ends"
#define RTG_EXIT_DAEMON		"term"
#define RTG_CREATE_GANG		"create"
#define RTG_FINISH_GANG		"finish"
#define RTG_CHANGE_LLVL		"change"

#define RTG_SUCCESS		"SUCCESS"
#define RTG_FAILURE		"FAILURE"

#endif /* __RTG_COMMON_H__ */
