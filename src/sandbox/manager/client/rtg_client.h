#ifndef __RTG_CLIENT_H__
#define __RTG_CLIENT_H__

#include "../include/rtg_common.h"

static int setup_socket (void);
static void send_command (int sockfd, char* cmd);

#endif /* __RTG_CLIENT_H__ */

