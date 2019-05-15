#ifndef __RTG_CLIENT_H__
#define __RTG_CLIENT_H__

#include "rtg_common.h"

static int sockfd;

static int setup_socket (void);
static void send_command (char* cmd);
static void print_usage (char* exec_name);
static void handle_commands (int argc, char* argv []);

#endif /* __RTG_CLIENT_H__ */

