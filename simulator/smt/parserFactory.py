import os, re
from taskFactory import Task

class Aggregator:
    def __init__(self):
        return

    def run(self):
        '''
          Traverse the directory containing generated tasksets and their
          respective virtual-gangs data for further processing.
        '''
        assert os.path.exists('../light_generated'), ("Directory of generated data "
            "does not exists in the current folder.")

        tasksets = {}
        generated_taskset_dirs = os.listdir('../light_generated')

        for ts in generated_taskset_dirs:
            tsIdx, util, period = self.parse_taskset_dir(ts)

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

        return tasksets

    def parse_taskset(self, taskset_dir, nature):
        name_prefix = 'candidate_' if nature == 'real' else 'virtual_task'
        taskset_file = '../light_generated/%s/%sset.txt' % (taskset_dir, name_prefix)

        assert os.path.exists(taskset_file), ("Taskset file <%s> does "
                "not exists in the generated directory." % (taskset_file))

        pattern = '^Task:\s+([\d]+) \| C=\s*([\d.]+) P=\s*([\d]+)' \
            ' h=\s*([\d]+) r=\s*([\d]+) u=\s*([\d.]+) ([^\s]+)$'

        taskset = []
        with open(taskset_file, 'r') as fdi:
            lines = fdi.readlines()

            for l in lines:
                m = re.match(pattern, l)

                if not m:
                    continue

                tid = int(m.group(1))
                C = float(m.group(2))
                p = int(m.group(3))
                h = int(m.group(4))
                r = int(m.group(5))
                u = float(m.group(6))

                e = []
                members = ''
                if nature == 'real': e = self.__parse_edges(m.group(7))
                if nature == 'virtual': members = m.group(7)[2:]

                taskset.append(Task(tid, C, p, h, r, e, members))

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
