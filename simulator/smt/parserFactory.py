import os, re, sys
from taskFactory import Task

class Aggregator:
    def __init__(self, gen_dir, debug = False):
        self.gen_dir = gen_dir
        self.debug = debug

        assert os.path.exists(self.gen_dir), ("Directory of generated data "
            "<%s> does not exists in the current folder. Try pristine run!" %
            (self.gen_dir))

        return

    def run(self, gftp = False, max_ts = None):
        '''
          Traverse the directory containing generated tasksets and their
          respective virtual-gangs data for further processing.
        '''
        idx = 0
        tasksets = {}
        generated_taskset_dirs = os.listdir(self.gen_dir)

        for ts in generated_taskset_dirs:
            idx += 1
            tsIdx, util, period = self.parse_taskset_dir(ts)
            if max_ts and tsIdx > max_ts: continue
            debug = False

            if self.debug:
                print "[PARSER] %4d / %4d | Parsing: <%20s>\r" % (idx,
                        len(generated_taskset_dirs), ts),

            sys.stdout.flush()

            if not tasksets.has_key(tsIdx):
                tasksets[tsIdx] = {}

            if not tasksets[tsIdx].has_key(util):
                tasksets[tsIdx][util] = {}

            if not tasksets[tsIdx][util].has_key(period):
                tasksets[tsIdx][util][period] = {}

            tasksets[tsIdx][util][period]['Real'] = \
                    self.parse_taskset(ts, 'real')

            tasksets[tsIdx][util][period]['Virtual'] = \
                    self.parse_taskset(ts, 'virtual')

            if gftp:
                tasksets[tsIdx][util][period]['GFTP'] = \
                        self.parse_taskset(ts, 'scaled')

            if debug:
                print
                print "Taskset:", tsIdx
                print "  - Real:"
                print "   ", '\n    '.join([t.__str__() for t in tasksets[tsIdx][util][period]['Real']])
                print
                print "  - Virtual:"
                print "   ", '\n    '.join([t.__str__() for t in tasksets[tsIdx][util][period]['Virtual']])
                print

        if not max_ts and self.debug:
            print
            print "[PARSER] Parsing Complete!"

        return tasksets

    def parse_taskset(self, taskset_dir, nature, debug = False):
        if nature != 'scaled':
            name_prefix = 'candidate_' if nature == 'real' else 'virtual_task'
            taskset_file = '%s/%s/%sset.txt' % (self.gen_dir, taskset_dir,
                    name_prefix)
        else:
            taskset_file = '%s/%s/gftp.txt' % (self.gen_dir, taskset_dir)

        # assert os.path.exists(taskset_file), ("Taskset file <%s> does "
        #         "not exists in the generated directory." % (taskset_file))
        if not os.path.exists(taskset_file):
            print
            print "[ERROR] File does not exist: %s" % (taskset_file)
            print
            return []

        pattern = '^Task:\s+([\d]+) \| C=\s*([\d.]+) P=\s*([\d]+)' \
            ' h=\s*([\d]+) r=\s*([\d]+) u=\s*([\d.]+)(.*)$'

        taskset = []
        if debug: print "\nTaskset File: %s\n" % (taskset_file)
        with open(taskset_file, 'r') as fdi:
            lines = fdi.readlines()

            for l in lines:
                if debug: print "\n  - Matching line: %s" % (l)
                m = re.match(pattern, l)

                if not m:
                    if debug: print "    * Not Matched."
                    continue

                if debug: print "    * Matched!"
                tid = int(m.group(1))
                C = float(m.group(2))
                p = int(m.group(3))
                h = int(m.group(4))
                r = int(m.group(5))
                u = float(m.group(6))

                e = []
                members = ''
                if nature == 'real': e = self.__parse_edges(m.group(7))
                if nature == 'virtual': members = self.__parse_members(m.group(7))

                taskset.append(Task(tid, C, p, h, r, e, members))

        if taskset == []:
            print
            print "Empty taskset: %s" % (taskset_file)
            print

        return taskset

    def parse_taskset_dir(self, ts_dir):
        pattern = r'ts([\d]+)_u([\d]+)_p([\d]+)'
        m = re.match(pattern, ts_dir)

        assert m, ("Taskset directory <%s> does not match expected "
                "pattern." % (ts_dir))

        tsIdx = int(m.group(1))
        util = int(m.group(2))
        period = int(m.group(3))

        return tsIdx, util, period

    def __parse_edges(self, edge_string):
        if edge_string == 'None':
            return []

        pattern = r'->t([\d]+)'
        edge_list = [int(e) for e in re.findall(pattern, edge_string)]

        return edge_list

    def __parse_members(self, member_string):
        pattern = r'm=(.*)'

        members = re.findall(pattern, member_string)[0]

        return members
