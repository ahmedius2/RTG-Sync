#include "rtg_client.h"

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
