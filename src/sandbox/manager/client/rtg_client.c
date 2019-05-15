/******************************************************************************
 * File:	rtg_client.c
 * Description:	Helper program for communicating with the RT-Gang daemon at
 * 		runtime. Provides interface for issuing command(s) to the
 * 		daemon and displaying their status.
 * Author:	wali@ku.edu
 *****************************************************************************/
#include "rtg_client.h"

/*
 * setup_socket: Helper function to create a socket for communication with
 * RT-Gang daemon.
 *
 * @return		Integer indicating socket file descriptor
 */
static int setup_socket (void)
{
	int ret;
	int sockfd;
	struct sockaddr_un saun;

	saun.sun_family = AF_UNIX;
	strcpy (saun.sun_path, SOCKET_ADDRESS);

	sockfd = socket (PF_UNIX, SOCK_STREAM, 0);
	rtg_assert (sockfd >= 0, "Error Opening Socket");

	ret = connect (sockfd, (struct sockaddr *)&saun, sizeof (saun));
	rtg_assert (ret >= 0, "Error Connecting Sockets");

	return sockfd;
}

/*
 * send_command: Helper function to send command to RT-Gang daemon via provided
 * socket.
 *
 * @sockfd:		Socket file descriptor
 * @cmd:		A character string of command
 */
static void send_command (int sockfd, char* cmd)
{
	char buf [BSIZE];
	bzero (&buf, BSIZE);

	printf ("[RTG-CLIENT] Command: %s\n", cmd);
	write (sockfd, cmd, BSIZE);
	read (sockfd, buf, BSIZE);
	printf ("[RTG-CLIENT] Status: %s\n", buf);

	return;
}

int main (int argc, char *argv [])
{
	int sockfd;

	sockfd = setup_socket ();
	send_command (sockfd, "hello");
	send_command (sockfd, RTG_EXIT_DAEMON);
	close (sockfd);

	return 0;
}
