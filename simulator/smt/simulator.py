#!/usr/bin/env python
import json, argparse
import os, sys, shutil
import multiprocessing

from rtaFactory import RTA
from parserFactory import Aggregator
from tasksetGenerator import Generator
from virtualGangFactory import VirtualGangCreator

import matplotlib
import numpy as np
matplotlib.use('Agg')
import matplotlib.pyplot as plt

from colorama import init, Fore, Back, Style
init(autoreset = True)

def format_str(msg_type):
    style = {'INFO':   Style.NORMAL + Back.BLACK + Fore.GREEN   + '[ INFO ]',
             'STATUS': Style.BRIGHT + Back.BLACK + Fore.GREEN   + '[STATUS]',
             'ERROR':  Style.BRIGHT + Back.RED   + Fore.WHITE   + ' ERROR  ',
             'WARN':   Style.BRIGHT + Back.BLACK + Fore.YELLOW  + '[ WARN ]',
             'HINT':   Style.BRIGHT + Back.BLACK + Fore.YELLOW  + '[ HINT ]',
             'PROMPT': Style.BRIGHT + Back.BLACK + Fore.RED     + '[PROMPT]' + Style.RESET_ALL,
             'ACTION': Style.NORMAL + Back.BLACK + Fore.RED     + '[ACTION]' + Style.RESET_ALL}

    return style[msg_type]

def print_std_msg(msg_type, msg):
    print format_str(msg_type), msg

    return

def parse_cli_args():
    parser = argparse.ArgumentParser()
    sim_group = parser.add_mutually_exclusive_group()

    sim_group.add_argument('-p', '--pristine', help = "collect pristine data",
            action = "store_true", default = False)

    sim_group.add_argument('-d', '--demo_mode', help = "illustrate the \
            simulation steps with an example run", action = "store_true",
            default = False)

    parser.add_argument('-v', '--verbose', help = "specify output verbosity",
            action = "count", default = 0)

    parser.add_argument('-t', '--taskset_type', help = "type of taskset",
            choices = ['light', 'mixed', 'heavy'], default = 'light')

    parser.add_argument('-n', '--num_of_tasksets', help = "number of tasksets \
            to generate for each util. point", type = int, choices = [1, 10,
                100, 1000], default = 4)

    parser.add_argument('-e', '--edge_probability', help = "edge probability in \
            generated tasksets", type = int, choices = [0, 25, 50, 75],
            default = 0)

    parser.add_argument('-r', '--demand_type', help = "type of resource \
            demand", choices = ['0', 'r'], default = 'r')

    parser.add_argument('-m', '--core_count', help = "number of cores 'm' for \
            the simulation", type = int, choices = [4, 8, 16, 32], default = 4)

    parser.add_argument('-N', '--tasks_per_period', help = "max. number of tasks \
            in any candidate-set", type = int,
            choices = [4, 8, 10, 12], default = 6)

    args = parser.parse_args()

    print "\n************************************************"
    print_std_msg("STATUS", "Starting Simulation")

    if args.verbose >= 1 or args.demo_mode:
        if args.demo_mode:
            print_std_msg("INFO", "DEMO MODE ACTIVATED!")
            print_std_msg("INFO", "CLI parameters will be ignored. Instead, ")
            print "         appropriate values will be used for all "
            print "         parameters.\n"

            args.core_count = 8
            args.pristine = True
            args.demand_type = 'r'
            args.num_of_tasksets = 1
            args.tasks_per_period = 4
            args.edge_probability = 50
            args.taskset_type = 'mixed'

        print_std_msg("INFO", "Simulation Params:")
        print "           PRISTINE               =", args.pristine
        print "           DEMO_MODE              =", args.demo_mode
        print "           Taskset Type           =", args.taskset_type
        print "           Core Count         (m) =", args.core_count
        print "           # of Tasksets      (n) =", args.num_of_tasksets
        print "           Edge Probability   (e) =", args.edge_probability
        print "           Demand Type        (r) =", args.demand_type
        print "           Max. Candidate Set (N) =", args.tasks_per_period

    print "************************************************\n"

    return args

def virtual_gang_generator_thread_entry(tsIdx, args):
    if args.verbose >= 3:
        print "[THRD-%d] Starting..." % (tsIdx)

    tf_params = {
        'seed'              : tsIdx + 1,
        'num_of_cores'      : args.core_count,
        'demand_type'       : args.demand_type,
        'tasks_per_period'  : args.tasks_per_period,
        'edge_prob'         : args.edge_probability,
        'utils'             : range(1, args.core_count)
    }

    taskFactory = Generator(tf_params)
    taskset = taskFactory.create_taskset(args.taskset_type)
    if args.demo_mode and args.verbose >= 2:
        print "@@@@@ Generated Taskset"
        taskFactory.print_taskset(taskset)
        print

    virtual_taskset = {}
    for util in taskset:
        vg_idx = 0
        virtual_taskset[util] = {}

        for period, candidate_set in taskset[util].items():
            gen_dir = 'generated/%s_e%d_r%s' % (args.taskset_type,
                    args.edge_probability, args.demand_type)

            vgc_params = {
                'stop_interval'     : 1,
                'timeout'           : 2,
                'max_timeout'       : 30,
                'utilization'       : util,
                'taskset_index'     : tsIdx,
                'verify'            : True,
                'debug'             : False,
                'period'            : period,
                'gen_dir'           : gen_dir,
                'num_of_cores'      : args.core_count,
                'candidate_set'     : candidate_set,
                'tasks_per_period'  : args.tasks_per_period
            }

            print_progress(tsIdx, args.num_of_tasksets, util,
                    args.core_count, period)

            vgc_factory = VirtualGangCreator(vgc_params)
            virtual_taskset[util][period] = vgc_factory.run(vg_idx)

            try:
                vg_idx = virtual_taskset[util][period][-1].tid
            except:
                print "Virtual taskset does not exist for: tsIdx=%d util=%d \
                        period=%d" % (tsIdx, util, period)
                sys.exit()

    if args.demo_mode and args.verbose >= 2:
        print "\n\n@@@@@ Virtual Taskset (SMT Solution)"
        taskFactory.print_taskset(virtual_taskset)

    if args.verbose >= 3:
        print "[THRD-%d] Done!" % (tsIdx)

    return

def print_progress(cur_taskset, max_tasksets, cur_util, max_util, period):
    print format_str('STATUS'), 'Processing Taskset: %4d / %-4d | Utilization: %2d '    \
            '/ %-2d | Period: %4d\r' % (cur_taskset, max_tasksets, cur_util, \
                    max_util, period),

    sys.stdout.flush()

    return

def parallel_create_virtual_taskset(args):
    processes = {}
    num_of_cores = multiprocessing.cpu_count()

    if args.verbose >= 2:
        print_std_msg("INFO", " Taskset generation will be parallelized on %d-Cores." \
                % (num_of_cores))

    for r in range(1, args.num_of_tasksets + 1, num_of_cores):
        for tsIdx in range(r, min(r + num_of_cores, args.num_of_tasksets + 1)):
            processes[tsIdx] = multiprocessing.Process(target = \
                    virtual_gang_generator_thread_entry, args = (tsIdx, args,))

            processes[tsIdx].start()

        for tsIdx in range(r, min(r + num_of_cores, args.num_of_tasksets + 1)):
            processes[tsIdx].join()

    print

    return

def check_previous_run_data(data_src):
    if os.path.exists(data_src):
        print_std_msg("WARN", "'%s' (directory/file) already exists!" % (data_src))
        print "         There might be stall data from previous run of "
        print "         the simulator which will get over-written by "
        print "         this run."
        prompt = raw_input(format_str('PROMPT') + " Remove '%s' (directory/file) [y/n]? " % \
                (data_src))

        if prompt == 'y':
            print format_str("ACTION"), "Deleting '%s' (directory/file)!\n" % (data_src)
            if os.path.isdir(data_src):
                shutil.rmtree(data_src)
            else:
                os.remove(data_src)
        else:
            print_std_msg("STATUS", "You have decided to keep the '%s' " % (data_src))
            print "         (directory/file). Please move it to a different "
            print "         location before running this program. Exiting!"
            sys.exit()

    return

def stratify_data(args, data):
    x = range(1, args.core_count + 1)
    y = [data[v] for v in x[:-1]] + [0]

    return x, y

def create_sched_plots(args, sched_hash, sched_list):
    plot_file = 'figures/%s_e%d_r%s.png' % (args.taskset_type,
        args.edge_probability, args.demand_type)

    fig = plt.subplots(1, 1, figsize = (10, 8))
    style = {'RT-Gang':    {'clr': 'red',     'mrk': 'o', 'lbl': 'RT-Gang'                  },
             'RTG-Sync':   {'clr': 'blue',    'mrk': '*', 'lbl': 'Virtual-Gang'             },
             'RTG-SYNCi':  {'clr': 'blue',    'mrk': '*', 'lbl': 'Virtual-Gang (No-Interf.)'},
             'h2-lnr-hyb': {'clr': 'green',   'mrk': '8', 'lbl': 'Virtual-Gang (Greedy)'    },
             'Threaded':   {'clr': 'cyan',    'mrk': 's', 'lbl': 'Threaded'                 },
             'Threadedi':  {'clr': 'cyan',    'mrk': 's', 'lbl': 'Threaded (No-Interf.)'    },
             'GFTP':       {'clr': 'magenta', 'mrk': '^', 'lbl': 'Gang FTP'                 },
             'GFTPi':      {'clr': 'magenta', 'mrk': '^', 'lbl': 'Gang FTP (No-Interf.)'    }}

    for s in sched_list:
        ls = '--' if s[-1] == 'i' else '-'
        x, y = stratify_data(args, sched_hash[s])

        plt.plot(x, y, lw = 1.5, color = style[s]['clr'], marker = style[s]['mrk'],
                label = style[s]['lbl'], linestyle = ls)

    plt.xlim([0.5, args.core_count + 0.5])
    plt.ylim([0, args.num_of_tasksets * 1.05])
    plt.xlabel('Utilizations', fontsize = 'x-large', fontweight = 'bold')
    plt.ylabel('Schedulable Tasksets', fontsize = 'x-large',
            fontweight = 'bold')

    plt.title(args.taskset_type.capitalize(), fontsize = 'xx-large',
            fontweight = 'bold')

    if args.taskset_type == 'mixed': plt.legend(fontsize = 'x-large')

    plt.savefig(plot_file)
    print Back.GREEN + Fore.WHITE + Style.BRIGHT + \
            "Plot can be seen here: ", Style.BRIGHT + plot_file

    return plot_file

def get_sched_data_from_file(sched_hash_file):
    if os.path.exists(sched_hash_file):
        sched_ratio = {}

        with open(sched_hash_file, 'r') as fdo:
            raw_hash = json.load(fdo)

            for sched in raw_hash:
                sched_ratio[sched] = {}

                for util in raw_hash[sched]:
                    sched_ratio[sched][int(util)] = raw_hash[sched][util]

            return sched_ratio

    print_std_msg("ERROR", " You have specified pristine=False which means that ")
    print "         the simulator should use data from prev. run to    "
    print "         create sched. plot. However, based on the CLI      "
    print "         params, the respective file containing sched. data "
    print "         from prev. run <%s> does not exist!" % (sched_hash_file)
    print format_str("HINT"), "Either perform pristine run or make sure that the  "
    print "         sched. data file is present. Exiting..."

    sys.exit()

def main():
    args = parse_cli_args()
    sched_hash_file = 'sim_data/%s_e%d_r%s.json' % (args.taskset_type,
            args.edge_probability, args.demand_type)

    schedulers = ['RT-Gang', 'RTG-Sync', 'h2-lnr-hyb']
    supp_scheds = ['RTG-Synci', 'GFTP', 'GFTPi', 'Threaded', 'Threadedi']

    if args.edge_probability == 0:
        schedulers = schedulers[:-1] + supp_scheds

    if not args.pristine:
        sched_ratio = get_sched_data_from_file(sched_hash_file)
        create_sched_plots(args, sched_ratio, schedulers)
        print_std_msg("STATUS", " Done!")
        sys.exit()

    check_previous_run_data("generated")
    parallel_create_virtual_taskset(args)
    gen_dir = 'generated/%s_e%d_r%s' % (args.taskset_type,
            args.edge_probability, args.demand_type)

    print_std_msg("STATUS", "Parsing execution data")
    aggregator = Aggregator(gen_dir, debug = (args.verbose >= 2))
    tasksets = aggregator.run(gftp = (args.edge_probability == 0))

    rta_params = {'num_of_cores': args.core_count}
    rta = RTA(rta_params)

    print_std_msg("STATUS", "Performing RTA")

    idx = 1
    sched_ratio = {s: {} for s in schedulers}
    num_of_tasksets = len(tasksets)

    for tsIdx in tasksets:
        u_tasksets = tasksets[tsIdx]

        for u, ts in u_tasksets.items():
            for s in schedulers:
                if not sched_ratio[s].has_key(u):
                    sched_ratio[s][u] = 0

                print format_str("STATUS"), "   Analyzing: U=%2d | Scheduler=%20s | " \
                        "Taskset: %5d / %-5d\r" % (u, s, tsIdx + 1,
                                num_of_tasksets),

                gen_dir = 'generated/%s_e%d_r%s/ts%d_u%d_p' % \
                    (args.taskset_type, args.edge_probability,
                            args.demand_type, tsIdx, u)

                schedulable = rta.run(ts, s, gen_dir, True)
                sched_ratio[s][u] += schedulable

    print "\n"
    check_previous_run_data(sched_hash_file)
    with open(sched_hash_file, 'w') as fdi:
        json.dump(sched_ratio, fdi)

    create_sched_plots(args, sched_ratio, schedulers)

    print_std_msg("STATUS", "Done!")

    return

if __name__ == '__main__':
    main()
