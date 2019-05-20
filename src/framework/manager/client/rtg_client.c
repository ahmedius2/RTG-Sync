/*
 * manager/client/rtg_client.c
 *
 * Helper program for communicating with the RT-Gang daemon at runtime.
 * Provides interface for issuing command(s) to the daemon and displaying their
 * status.
 *
 * Copyright (C) 2019 CSL-KU
 *
 * 2019-05-20	Send ID of the virtual gang in finish command
 */
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
 * @cmd:		A character string of command
 */
static void send_command (char* cmd)
{
	char buf [BSIZE];
	bzero (&buf, BSIZE);

	write (sockfd, cmd, BSIZE);
	read (sockfd, buf, BSIZE);
	printf ("[RTG-CLIENT] Status: %s\n", buf);

	return;
}

/*
 * print_usage: Display the options provided by this program.
 *
 * @exec_name		Name of the client executable file
 */
static void print_usage (char* exec_name)
{
	printf ("Usage: %s <options>\n", exec_name);
	printf ("\n");
	printf ("Options:\n");
	printf ("  -c <count>    Create a synchronization barrier with the given count.\n");
	printf ("                Print ID value issued to the new gang.\n");
	printf ("  -l <level>    Change log level of the RT-Gang daemon.\n");
	printf ("  -f <id>       Mark virtual gang of given ID as finished.\n");
	printf ("  -t            Terminate the RT-Gang daemon.\n");
	printf ("  -h            Show this help message.\n");
	printf ("\n");
	printf ("Example:\n");
	printf ("  $ %s -c 2 -l 1\n", exec_name);
	printf ("                Create barrier with count = 2 (i.e., to synchronize two\n");
	printf ("                processes) and change the log level for RT-Gang daemon to\n");
	printf ("                1 (RTG-WARNING).\n");

	return;
}

/*
 * handle_command: Parse the commands given to the client program and
 * communicate them to the RT-Gang daemon for further action.
 *
 * @argc		CLI argument count
 * @argv		CLI argument list
 */
static void handle_commands (int argc, char* argv [])
{
	int opt;
	int generic;
	char cmd [BSIZE];
	bzero (&cmd, BSIZE);

	while ((opt = getopt (argc, argv, "c:l:f:th")) != -1) {
		switch (opt) {
		case 'c':
			generic = strtol (optarg, NULL, 0);
			sprintf (cmd, "%s %d", RTG_CREATE_GANG, generic);
			send_command (cmd);
			break;
		case 'l':
			generic = strtol (optarg, NULL, 0);
			sprintf (cmd, "%s %d", RTG_CHANGE_LLVL, generic);
			send_command (cmd);
			break;
		case 'f':
			generic = strtol (optarg, NULL, 0);
			sprintf (cmd, "%s %d", RTG_FINISH_GANG, generic);
			send_command (cmd);
			break;
		case 't':
			send_command (RTG_EXIT_DAEMON);
			exit (EXIT_SUCCESS);
		case 'h':
			print_usage (argv [0]);
			break;
		default:
			printf ("[RTG-CLIENT] Unknown option: <%c>\n", opt);
			print_usage (argv [0]);
			break;
		}
	}

	return;
}

int main (int argc, char *argv [])
{
	setup_socket ();
	handle_commands (argc, argv);

	/*
	 * Unless one of the commands terminated the RT-Gang daemon (in which
	 * case we won't reach this point), we must notify the daemon that this
	 * session is finished and close the session socket before exiting
	 */
	send_command (RTG_END_SESSION);
	close (sockfd);

	return 0;
}
