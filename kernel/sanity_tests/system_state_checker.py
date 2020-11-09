#!/usr/bin/env python

import sys, os, re
from subprocess import Popen, PIPE

ERROR   = 0
WARNING = 1
STATUS  = 2
NORMAL  = 3
HEADER  = 4

PPL = '\033[95m'
BLU = '\033[94m'
CYN = '\033[96m'
GRN = '\033[92m'
YLW = '\033[93m'
RED = '\033[91m'

ENDC = '\033[0m'
BOLD = '\033[1m'
ULIN = '\033[4m'

debugfs_path = "/sys/kernel/debug"
cpu_sysfs_path = "/sys/devices/system/cpu"
sched_features_file = debugfs_path + "/sched_features"

def pretty_print(msg_type, msg):
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
        sched_features = fdi.readlines()[-1]

    if 'RT_GANG_LOCK' not in sched_features:
        return 'Not Available'

    if 'NO_RT_GANG_LOCK' in sched_features:
        return 'Disabled'

    return 'Enabled'

def get_cpuidle_state(cpu_node):
    cpuidle_state = {}
    cpuidle_node = cpu_node + '/cpuidle'

    states = []
    state_rex = r'state([\d]+)'
    cpuidle_contents = os.listdir(cpuidle_node)

    for node in cpuidle_contents:
        m = re.match(state_rex, node)

        if not m:
            continue

        states.append(node)

    states = sorted(states)

    for s in states:
        name = run_command('cat %s/%s/name' % (cpuidle_node, s))
        disable = run_command('cat %s/%s/disable' % (cpuidle_node, s))
        info = BOLD + RED + ULIN + 'Enabled' + ENDC

        if disable == '1':
            info = GRN + 'Disabled' + ENDC

        cpuidle_state[int(s[-1])] = {'name': 'Idle State (%s)' % (name.capitalize()),
                'value': info}

    return cpuidle_state

def get_pretty_info(node, cur_value, possible_values, short = False, gpu = False):
    info_string = ''
    cur_state = run_command("cat %s/%s" % (node, cur_value))
    possible_states = run_command("cat %s/%s" % (node, possible_values)).split()

    if short:
        min_freq = int(possible_states[0]) / 1024
        max_freq = int(possible_states[-1]) / 1024
        cur_freq = str(int(cur_state) / 1024)

        if gpu:
            min_freq /= 1024
            max_freq /= 1024
            cur_freq = str(int(cur_state) / 1024 / 1024)

        info_string = BOLD + ULIN + RED + cur_freq + ENDC
        info_string += ' <%s - %s> MHz' % (min_freq, max_freq)

        return info_string

    for state in possible_states:
        if state == cur_state:
            info_string += (BOLD + ULIN + RED + state + ENDC)
        else:
            info_string += state

        info_string += ' '

    return info_string.strip()

def get_cpufreq_state(cpu_node):
    cpufreq_state = {}
    cpufreq_node = cpu_node + '/cpufreq'

    governor = get_pretty_info(cpufreq_node,
            'scaling_governor', 'scaling_available_governors')
    cpufreq_state[0] = {'name': 'Scaling Governors', 'value': governor}

    scaling_min_freq = run_command("cat %s/scaling_min_freq" % (cpufreq_node))
    scaling_max_freq = run_command("cat %s/scaling_max_freq" % (cpufreq_node))

    scaling_min_freq = int(scaling_min_freq) / 1024
    scaling_max_freq = int(scaling_max_freq) / 1024

    scaling_range = '%s - %s MHz' % (scaling_min_freq, scaling_max_freq)
    cpufreq_state[1] = {'name': 'Scaling Allowed Range (min - max)', 'value':
            scaling_range}

    scaling_freqs = get_pretty_info(cpufreq_node,
            'scaling_cur_freq', 'scaling_available_frequencies', True)
    cpufreq_state[2] = {'name' : 'Possible Frequencies (cur <min - max>)',
            'value': scaling_freqs}

    cpuinfo_cur_freq = run_command("cat %s/cpuinfo_cur_freq" % (cpufreq_node))
    cpuinfo_max_freq = run_command("cat %s/cpuinfo_max_freq" % (cpufreq_node))
    cpuinfo_min_freq = run_command("cat %s/cpuinfo_min_freq" % (cpufreq_node))

    cpuinfo_cur_freq = str(int(cpuinfo_cur_freq) / 1024)
    cpuinfo_max_freq = int(cpuinfo_max_freq) / 1024
    cpuinfo_min_freq = int(cpuinfo_min_freq) / 1024

    actual_freq = '%s <%s - %s> MHz' % ((BOLD + RED + ULIN + cpuinfo_cur_freq +
        ENDC), cpuinfo_min_freq, cpuinfo_max_freq)
    cpufreq_state[3] = {'name': 'Actual Frequency (cur <min - max>)', 'value':
            actual_freq}

    return cpufreq_state

def get_core_freq_state(core_id):
    core_state = {}
    core_sysfs_node = cpu_sysfs_path + '/cpu%d' % (core_id)

    if not os.path.isdir(core_sysfs_node):
        pretty_print(ERROR, "sysfs node <%s> for core id <%d> does not "
            "exist!" % (core_sysfs_node, core_id))
        sys.exit()

    online = run_command("cat %s/online" % core_sysfs_node)

    if online != '1':
        return {}

    core_state['cpufreq'] = get_cpufreq_state(core_sysfs_node)
    core_state['cpuidle'] = get_cpuidle_state(core_sysfs_node)

    return core_state

def query_cpu_state(state):
    core_state = {}
    lscpu = run_command("lscpu")

    num_of_cpus = int(re.findall('CPU\(s\):.*([\d]+)', lscpu)[0])
    online_cpus = re.findall('On-line CPU\(s\).*:\D+([\d\-]+)', lscpu)[0]
    offline_cpus = re.findall('Off-line CPU\(s\).*:\D+([\d\-]+)', lscpu)[0]

    state[1] = {'name': '# of Cores',   'value': num_of_cpus}
    state[2] = {'name': 'Online Cores', 'value': online_cpus}
    state[3] = {'name': 'Offline Cores', 'value':  offline_cpus}

    for core_id in [0]: # range(num_of_cpus):
        core_info = get_core_freq_state(core_id)

        if core_info:
            core_state[core_id] = core_info

    return core_state

def query_gpu_state(gpu_node):
    gpu_state = {}

    governor = get_pretty_info(gpu_node,
            'governor', 'available_governors')
    gpu_state[0] = {'name': 'Scaling Governors', 'value': governor}

    frequency = get_pretty_info(gpu_node,
            'target_freq', 'available_frequencies', True, True)
    gpu_state[1] = {'name': 'Possible Frequencies (cur <min - max>)',
            'value': frequency}

    gpu_cur_freq = run_command("cat %s/cur_freq" % (gpu_node))
    gpu_max_freq = run_command("cat %s/max_freq" % (gpu_node))
    gpu_min_freq = run_command("cat %s/min_freq" % (gpu_node))

    gpu_cur_freq = str(int(gpu_cur_freq) / 1024 / 1024)
    gpu_max_freq = int(gpu_max_freq) / 1024 / 1024
    gpu_min_freq = int(gpu_min_freq) / 1024 / 1024

    actual_freq = '%s <%s - %-4s> MHz' % ((BOLD + RED + ULIN + gpu_cur_freq +
        ENDC), gpu_min_freq, gpu_max_freq)
    gpu_state[2] = {'name': 'Actual Frequency (cur <min - max>)', 'value':
            actual_freq}

    return gpu_state

def print_state(state, per_core_freq_state, gpu_state):
    table_fmt = '%40s | %-75s'
    table_hdr = table_fmt % ('Node', 'State')
    hline = (len(table_hdr) + 5) * '='
    cline = (len(table_hdr) + 5) * '-'

    pretty_print(NORMAL, hline)
    pretty_print(HEADER, table_hdr)
    pretty_print(NORMAL, hline)

    order = sorted(state.keys())
    for key in order:
        line = table_fmt % (state[key]['name'], state[key]['value'])
        print line

    print
    pretty_print(NORMAL, cline)
    print BOLD + GRN + "CPU Frequency State (for online cores)" + ENDC

    core_order = sorted(per_core_freq_state.keys())
    for core in core_order:
        # print YLW + "==== Core %d" % (core) + ENDC

        for policy in per_core_freq_state[core]:
            policy_dict = per_core_freq_state[core][policy]
            policy_key_order = sorted(policy_dict.keys())

            for key in policy_key_order:
                line = table_fmt % (policy_dict[key]['name'],
                        policy_dict[key]['value'])
                print line
        print

    pretty_print(NORMAL, cline)
    print BOLD + GRN + "GPU Frequency State" + ENDC
    order = sorted(gpu_state.keys())

    for key in order:
        line = table_fmt % (gpu_state[key]['name'],
                gpu_state[key]['value'])
        print line

    pretty_print(NORMAL, hline)
    print

    return

def main():
    state = {}
    gpu_state = {}

    check_root()
    rtgang_enabled = check_rtgang()
    state[0] = {'name': 'RT-Gang', 'value': rtgang_enabled}
    per_core_freq_state = query_cpu_state(state)

    if len(sys.argv) > 1 and sys.argv[1] == 'xavier':
        gpu_sysfs_node = '/sys/devices/gpu.0/devfreq/17000000.gv11b'
        gpu_state = query_gpu_state(gpu_sysfs_node)

    print_state(state, per_core_freq_state, gpu_state)

    return

if __name__ == '__main__':
    main()
