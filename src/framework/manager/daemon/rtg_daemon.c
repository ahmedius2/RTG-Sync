/*
 * manager/daemon/rtg_daemon.c
 *
 * RT-Gang daemon program. Receives commands from RT-Gang client(s) via sockets
 * and performs necessary actions related to virtual gang management
 *
 * Copyright (C) 2019 CSL-KU
 *
 * 2019-05-17	Create barrier in a specific file upon request
 * 2019-05-18	Issue a unique token for every new virtual gang
 * 2019-05-19	Keep track of active gangs
 * TODO 	Output log messages to a dedicated file
 */
#include "rtg_daemon.h"

/*
 * setup_handshake_socket: Create socket for handshake with an RT-Gang client
 * at a predefined location.
 */
static void setup_handshake_socket (void)
{
	int ret;
	struct sockaddr_un saun;

	saun.sun_family = AF_UNIX;
	strcpy (saun.sun_path, SOCKET_ADDRESS);

	handshake_sockfd = socket (PF_UNIX, SOCK_STREAM, 0);
	rtg_assert (handshake_sockfd >= 0, "Error Opening Socket");

	unlink (SOCKET_ADDRESS);
	ret = bind (handshake_sockfd, (struct sockaddr *)&saun, sizeof (saun));
	rtg_assert (ret >= 0, "Error Binding Socket");

	return;
}

/*
 * wait_for_handshake: Block on handshake socket until a client requests
 * connection. Create a session socket upon connection.
 *
 * @return		Integer file descriptor for session socket
 */
static int wait_for_handshake (void)
{
	int ret;
	int session_sockfd;

	ret = listen (handshake_sockfd, QSIZE);
	rtg_assert (ret >= 0, "Error Listening on Socket");

	session_sockfd = accept (handshake_sockfd, NULL, NULL);
	rtg_assert (session_sockfd >= 0, "Error Accepting Socket");

	return session_sockfd;
}

/*
 * wait_for_command: Block on session socket until a command is received from
 * client.
 *
 * @session_sockfd	Integer file descriptor of session socket
 * @return		Command string received from client
 */
static char* wait_for_command (int session_sockfd)
{
	int ret;
	char *buf;

	buf = malloc (BSIZE);
	rtg_assert (buf != NULL, "Error Allocating Memory");
	bzero (buf, BSIZE);

	ret = read (session_sockfd, buf, BSIZE);
	rtg_assert (ret >= 0, "Error Reading from Socket");

	return buf;
}

/*
 * rtg_create_gang: Create shared memory barrier and generate a unique ID for a
 * new virtual gang.
 *
 * @member_count	Max. members of the virtual gang
 * @return		Pointer of the virtual gang tracker node
 */
static rtg_vgang_node_t* rtg_create_gang (int member_count)
{
	int id = ++next_id;
	rtg_vgang_node_t *node;

	node = allocate_node ();
	node->id = id;
	node->barrier = rtg_daemon_setup (id, member_count);
	rtg_hash_add (node);

	return node;
}

/*
 * rtg_destroy_gang: Perform cleanup for the virtual gang with the given ID.
 *
 * @id			Integer ID value of the finished virtual gang
 */
static void rtg_destroy_gang (int id)
{
	rtg_vgang_node_t *node;

	node = rtg_hash_get (id);
	rtg_daemon_cleanup (node->barrier, id);
	rtg_hash_del (node);
	free (node);

	return;
}

/*
 * parse_command: Perform the necessary action for the command received from
 * client.
 *
 * @cmd			Character string denoting command
 * @session_sockfd	Integer file descriptor of session socket
 * @return		Boolean value indicating status
 */
static bool parse_command (char* cmd, int session_sockfd)
{
	int generic;
	bool ret = true;
	char buf [BSIZE];
	rtg_vgang_node_t *node;

	RTG_LOG (RTG_DEBUG, "Command: %s\n", cmd);
	bzero (buf, BSIZE);

	if (RTG_CMD_IS (RTG_EXIT_DAEMON)) {
		RTG_LOG (RTG_CRITICAL, "Terminating!!\n");
		close (session_sockfd);
		close (handshake_sockfd);
		exit (EXIT_SUCCESS);
	} else if (RTG_CMD_IS (RTG_END_SESSION)) {
		RTG_LOG (RTG_WARNING, "Ending Session!\n");
		write (session_sockfd, RTG_SUCCESS, sizeof (RTG_SUCCESS));
		close (session_sockfd);
		return false;
	} else if (RTG_CMD_IS (RTG_CREATE_GANG)) {
		RTG_GET_ARG (RTG_CREATE_GANG, &generic);
		node = rtg_create_gang (generic);
		RTG_LOG (RTG_STATUS,
			"Creating barrier with count = %d\n", generic);
		sprintf (buf, "%s %d", RTG_CREATE_GANG, node->id);
		write (session_sockfd, buf, BSIZE);
		return true;
	} else if (RTG_CMD_IS (RTG_FINISH_GANG)) {
		RTG_GET_ARG (RTG_FINISH_GANG, &generic);
		RTG_LOG (RTG_STATUS, "Destroying Virtual Gang\n");
		rtg_destroy_gang (generic);
	} else if (RTG_CMD_IS (RTG_CHANGE_LLVL)) {
		RTG_GET_ARG (RTG_CHANGE_LLVL, &generic);
		RTG_LOG (RTG_STATUS,
			"Changing log level. prev = %d | new = %d\n",
			rtg_log_level, generic);
		rtg_log_level = generic;
	} else {
		RTG_LOG (RTG_WARNING, "Unknown Command: %s\n", cmd);
	}

	write (session_sockfd, RTG_SUCCESS, sizeof (RTG_SUCCESS));
	return true;
}

/*
 * manage_session: Receive commands from client until the session end
 * (indicated by a special command from client).
 *
 * @session_sockfd	Integer file descriptor of session socket
 */
static void manage_session (int session_sockfd)
{
	bool ret;
	char* cmd;

	for (;;) {
		cmd = wait_for_command (session_sockfd);
		ret = parse_command (cmd, session_sockfd);
		free (cmd);

		if (!ret) break;
	}

	return;
}

int main (int argc, char *argv [])
{
	bool ret;
	int session_sockfd;

	setup_handshake_socket ();

	for (;;) {
		session_sockfd = wait_for_handshake ();
		manage_session (session_sockfd);
	}

	return 0;
}
