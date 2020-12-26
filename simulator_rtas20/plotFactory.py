import sys
import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt

class Plotter:
    def __init__ (self, tasks_per_period):
        self.data = {}
        self.legendFz = 12
        self.labelFw =  'bold'
        self.titleFw =  'bold'
        self.labelFz =  'x-large'
        self.titleFz =  'xx-large'
        self.tpp = tasks_per_period

        return

    def create_schedulability_plot (self, policies, resultsHash, workloadType, M):
        fig, [ax1, ax2, ax3] = plt.subplots (1, 3, sharey = True, sharex = True, figsize = (16, 4))
        plt.subplots_adjust (wspace = 0.1)

        styleHash = {'rtgang'               : {'lbl': 'RT-Gang',             'mrk': 'r-o'},
                     'gftp'                 : {'lbl': 'Gang-FTP',            'mrk': 'm-p'},
                     'gftp-ideal'           : {'lbl': 'Gang-FTP (Ideal)',    'mrk': 'm--p'},
                     'threaded'             : {'lbl': 'Threaded',            'mrk': 'c-D'},
                     'threaded-ideal'       : {'lbl': 'Threaded (Ideal)',    'mrk': 'c--D'},
                     'rtgsync-gpc'          : {'lbl': 'RTG-Sync(GPC)',       'mrk': 'g-^'},
                     'rtgsync-ideal-gpc'    : {'lbl': 'RTG-Sync(GPC-Ideal)', 'mrk': 'g--^'},
                     'rtgsync-bfc'          : {'lbl': 'RTG-Sync(BFC)',       'mrk': 'b-x'},
                     'rtgsync-ideal-bfc'    : {'lbl': 'RTG-Sync(BFC-Ideal)', 'mrk': 'b--x'}}

        workloadLabel = {'light': 'Lightly Parallel',
                         'mixed': 'Mixed',
                         'heavy': 'Heavily Parallel'}

        legendLocation = {'light': 'upper right',
                          'mixed': 'lower left',
                          'heavy': 'lower left'}

        workloadAxes = {'light': ax1,
                        'mixed': ax2,
                        'heavy': ax3}

        ax1.set_ylabel ("Schedulability", fontsize = self.labelFz, fontweight = self.labelFw)
        ax2.set_xlabel ('Utilization', fontsize = self.labelFz,
                fontweight = self.labelFw)

        for w in ['heavy', 'mixed', 'light']:
            ax = workloadAxes [w]
            for policy in policies:
                utils, sched = self.__stratify_data (resultsHash [w][policy])
                ax.plot (utils, sched, styleHash [policy]['mrk'], lw = 2.0,
                        label = styleHash [policy]['lbl'])
            ax.set_title (workloadLabel [w], fontsize = self.titleFz, fontweight = self.titleFw, y = 1.2)
            ax.grid (True)

            for tick in ax.xaxis.get_major_ticks():
                tick.label1.set_fontsize(15)
                tick.label1.set_fontweight('bold')
            for tick in ax.yaxis.get_major_ticks():
                tick.label1.set_fontsize(15)
                tick.label1.set_fontweight('bold')

        plt.ylim (-0.05, 1.05)
        ax3.legend (loc = 'upper left', ncol = 5, fontsize = self.legendFz, handlelength = 4, bbox_to_anchor = (-2.2, 0.22, 3.5, 1), mode = {"expand"}, fancybox = True)

        additional_name = '' if not self.tpp else '_t%s' % (self.tpp)
        plt.savefig ('c%d%s.pdf' % (M, additional_name), bbox_inches = 'tight')

        return

    def __stratify_data (self, utilizationHash):
        utils = sorted (utilizationHash.keys ())
        sched = [utilizationHash [u] for u in utils]

        return utils, sched
