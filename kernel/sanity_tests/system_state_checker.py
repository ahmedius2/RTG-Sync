#!/usr/bin/env python

import sys
from subprocess import Popen, PIPE

ERROR   = 0
WARNING = 1
STATUS  = 2
NORMAL  = 3
HEADER  = 4

debugfs_path = "/sys/kernel/debug"
sched_features_file = debugfs_path + "/sched_features"

def pretty_print(msg_type, msg):
    PPL = '\033[95m'
    BLU = '\033[94m'
    CYN = '\033[96m'
    GRN = '\033[92m'
    YLW = '\033[93m'
    RED = '\033[91m'

    ENDC = '\033[0m'
    BOLD = '\033[1m'
    ULIN = '\033[4m'

    if msg_type == ERROR:
        print (RED + BOLD + "[ERROR] " + ENDC + RED + ULIN + msg + ENDC)
    elif msg_type == WARNING:
        print (YLW + BOLD + "[WARNING] " + ENDC + YLW + msg + ENDC)
    elif msg_type == STATUS:
        print (GRN + "[STATUS] " + msg + ENDC)
    elif msg_type == HEADER:
        print (GRN + BOLD + msg + ENDC)
    else:
        print (GRN + msg + ENDC)

    return

def run_command(cmd):
    p = Popen(cmd.split(), stdout = PIPE, stderr = PIPE)
    stdout, stderr = p.communicate()

    assert stderr == "", ("\n\tCommand <%s> failed!\n\t[ERROR] %s" %
            (cmd, stderr))

    return stdout.strip()

def check_root():
    user = run_command("whoami")

    if user != "root":
        pretty_print(ERROR, "This script must be invoked as root!")
        sys.exit()

    return

def check_rtgang():
    sched_features = ""

    with open(sched_features_file, 'r') as fdi:
        sched_features = fdi.readlines()

    if 'NO_RT_GANG_LOCK' in sched_features:
        return False

    return True

def print_state(state):
    table_fmt = '%20s | %-30s'
    table_hdr = table_fmt % ('Node', 'State')
    hline = (len(table_hdr) + 5) * '-'

    pretty_print(NORMAL, hline)
    pretty_print(HEADER, table_hdr)
    pretty_print(NORMAL, hline)

    for key, value in state.items():
        line = table_fmt % (key.capitalize(), value)
        print line

    pretty_print(NORMAL, hline)
    print

    return

def main():
    state = {}

    check_root()
    state['rtgang'] = check_rtgang()
    print_state(state)

    return

if __name__ == '__main__':
    main()
