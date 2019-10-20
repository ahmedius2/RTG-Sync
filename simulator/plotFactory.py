import sys
import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt

class Plotter:
    def __init__ (self):
        self.data = {}
        self.labelFz = 'large'
        self.labelFw = 'bold'
        self.legendFz = 'medium'
        self.titleFz = 'x-large'
        self.titleFw = 'bold'

        return

    def create_schedulability_plot (self, resultsHash, workloadType, M):
        fig = plt.figure (figsize = (7, 5))
        styleHash = {'rtgang'      : {'lbl': 'RT-Gang',       'mrk': 'r-o'},
                     'gangftp'     : {'lbl': 'Gang-FTP',      'mrk': 'm-p'},
                     'rtgsynch_gpc': {'lbl': 'RTG-Synch-GPC', 'mrk': 'g-^'},
                     'rtgsynch_bfc': {'lbl': 'RTG-Synch-BFC', 'mrk': 'b-x'},
                     'threadglobal': {'lbl': 'Thread-Global', 'mrk': 'c-D'}}

        workloadLabel = {'mixed': 'Mixed',
                         'light': 'Lightly Parallel',
                         'heavy': 'Heavily Parallel'}

        for policy in resultsHash:
            utils, sched = self.__stratify_data (resultsHash [policy])
            plt.plot (utils, sched, styleHash [policy]['mrk'],
                    label = styleHash [policy]['lbl'])

        plt.grid (True)
        plt.ylim (0, 1.1)
        plt.xlim (1, utils [-1])
        if workloadType == 'mixed':
            plt.legend (loc = 'lower left', ncol = 1,
                    fontsize = self.legendFz)
        plt.xlabel ('Utilization', fontsize = self.labelFz,
                fontweight = self.labelFw)
        plt.ylabel ('Schedulability', fontsize = self.labelFz,
                fontweight = self.labelFw)
        plt.title ('%s' % (workloadLabel [workloadType]),
                fontsize = self.titleFz, fontweight = self.titleFw)

        plt.savefig ('%s_c%d.pdf' % (workloadType, M), bbox_inches = 'tight')

        return

    def __stratify_data (self, utilizationHash):
        utils = sorted (utilizationHash.keys ())
        sched = [utilizationHash [u] for u in utils]

        return utils, sched
