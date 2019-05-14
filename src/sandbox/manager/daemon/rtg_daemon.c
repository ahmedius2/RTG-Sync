#include "rtg_daemon.h"

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

static bool parse_command (char* cmd, int session_sockfd)
{
	bool ret = true;

	RTG_LOG (RTG_DEBUG, "Command: %s\n", cmd);
	write (session_sockfd, RTG_SUCCESS, strlen (RTG_SUCCESS));

	if (RTG_CMD_IS (RTG_EXIT_DAEMON)) {
		RTG_LOG (RTG_CRITICAL, "Terminating!!n");
		close (session_sockfd);
		close (handshake_sockfd);
		exit (EXIT_SUCCESS);
	} else if (RTG_CMD_IS (RTG_END_SESSION)) {
		RTG_LOG (RTG_WARNING, "Ending Session!\n");
		ret = false;
		close (session_sockfd);
	} else if (RTG_CMD_IS (RTG_CREATE_GANG)) {
		RTG_LOG (RTG_STATUS, "Creating Virtual Gang\n");
		rtg_daemon_setup ("/tmp/rtg.barrier", 2);
	} else if (RTG_CMD_IS (RTG_FINISH_GANG)) {
		RTG_LOG (RTG_STATUS, "Destroying Virtual Gang\n");
	} else if (RTG_CMD_IS (RTG_CHANGE_LLVL)) {
		RTG_LOG (RTG_STATUS, "Changing Log Level\n");
	} else {
		RTG_LOG (RTG_WARNING, "Unknown Command: %s\n", cmd);
	}

	return ret;
}

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
