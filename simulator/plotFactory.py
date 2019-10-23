import sys
import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt

class Plotter:
    def __init__ (self):
        self.data = {}
        self.labelFz =  'x-large'
        self.labelFw =  'bold'
        self.legendFz = 'x-large'
        self.titleFz =  'xx-large'
        self.titleFw =  'bold'

        return

    def create_schedulability_plot (self, resultsHash, workloadType, M):
        fig = plt.figure (figsize = (6, 5))
        styleHash = {'rtgang'      : {'lbl': 'RT-Gang',       'mrk': 'r-o'},
                     'gangftp'     : {'lbl': 'Gang-FTP',      'mrk': 'm-p'},
                     'rtgsynch_gpc': {'lbl': 'RTG-Sync-GPC', 'mrk': 'g-^'},
                     'rtgsynch_bfc': {'lbl': 'RTG-Sync-BFC', 'mrk': 'b-x'},
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

        ax = plt.gca ()
        for tick in ax.xaxis.get_major_ticks():
            tick.label1.set_fontsize(15)
            # tick.label1.set_fontweight('bold')
        for tick in ax.yaxis.get_major_ticks():
            tick.label1.set_fontsize(15)
            # tick.label1.set_fontweight('bold')

        plt.savefig ('%s_c%d.pdf' % (workloadType, M), bbox_inches = 'tight')

        return

    def __stratify_data (self, utilizationHash):
        utils = sorted (utilizationHash.keys ())
        sched = [utilizationHash [u] for u in utils]

        return utils, sched
