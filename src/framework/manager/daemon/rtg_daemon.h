#ifndef __RTG_DAEMON_H__
#define __RTG_DAEMON_H__

#include "rtg_common.h"
#include "hashtable.h"

#define RTG_CRITICAL			(0)
#define RTG_WARNING			(1)
#define RTG_STATUS			(2)
#define RTG_DEBUG			(3)

#define RTG_LOG(lvl, fmt, ...)					\
do {								\
	if (lvl <= rtg_log_level) {				\
		printf ("[RTG-DAEMON] ");			\
		printf (fmt, ##__VA_ARGS__);			\
	}							\
} while (0);

#define RTG_CMD_IS(target)					\
	!strncmp (cmd, target, strlen (target))

#define RTG_GET_ARG(target, ptr)				\
	sscanf (cmd + strlen (target) + 1, "%d", ptr)

#define RTG_HASH_BITS			(4)
#define RTG_HASH_SIZE			(1UL << RTG_HASH_BITS)
DEFINE_HASHTABLE (rtg_hash, RTG_HASH_BITS);

/*
 * This data structure will be used for keeping track of active virtual gangs.
 * The barrier item indicates the pthread barrier created on behalf of the gang
 * and will be removed once the virtual gang is finished.
 */
typedef struct {
	int			id;
	pthread_barrier_t*	barrier;
	struct hlist_node	hlist;
} rtg_vgang_node_t;

/*
 * Global variable used to control logging level of daemon.
 */
static int rtg_log_level = 0;

/*
 * Socket file descriptor to be used for handshake with client applications. It
 * is supposed to persists throughout the daemon's life span.
 */
static int handshake_sockfd;

/*
 * Global value to be used for sequentially assigning virtual gang IDs to
 * clients; starting at the value declared here.
 */
static int next_id = 1000;

/*
 * allocate_node: Helper function for dynamically allocating memory for a
 * virtual gang tracker node in the global dictionary of the daemon.
 *
 * @return	Virtual gang tracker node pointer
 */
static inline rtg_vgang_node_t* allocate_node (void)
{
	rtg_vgang_node_t *node;

	node = (rtg_vgang_node_t *)malloc (sizeof (rtg_vgang_node_t));
	rtg_assert (node != NULL, "Failed to allocate vgang node");
	memset ((void *)node, 0, sizeof (rtg_vgang_node_t));

	return node;
}

/*
 * rtg_hash_get: Helper function to search the global dictionary of daemon for
 * a virtual gang tracker node with the given ID.
 *
 * @id		Integer ID value of the target tracker node
 * @return	Virtual gang tracker node pointer or NULL
 */
static inline rtg_vgang_node_t* rtg_hash_get (int id)
{
	int bucket = hash_min (id, RTG_HASH_BITS);
	rtg_vgang_node_t *node;

	hlist_for_each_entry (node, &rtg_hash [bucket], hlist) {
		if (node->id == id)
		return node;
	}

	RTG_LOG (RTG_WARNING, "ID=%d not found in hash bucket=%d!\n", id,
			bucket);
	return NULL;
}

#define rtg_hash_add(node)					\
	hash_add (rtg_hash, &node->hlist, node->id);

#define rtg_hash_del(node)					\
	hash_del (&node->hlist)

#define rtg_hash_for_each(bkt, current)				\
	hash_for_each (rtg_hash, bkt, current, hlist)

static void setup_handshake_socket (void);
static int wait_for_handshake (void);
static char* wait_for_command (int session_sockfd);
static bool parse_command (char* cmd, int session_sockfd);
static void manage_session (int session_sockfd);

#endif /* __RTG_DAEMON_H__ */
