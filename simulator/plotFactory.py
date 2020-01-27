import sys
import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt

class Plotter:
    def __init__ (self, tasks_per_period):
        self.data = {}
        self.legendFz = 6
        self.labelFw =  'bold'
        self.titleFw =  'bold'
        self.labelFz =  'x-large'
        self.titleFz =  'xx-large'
        self.tpp = tasks_per_period

        return

    def create_schedulability_plot (self, policies, resultsHash, workloadType, M):
        fig = plt.figure (figsize = (6, 5))
        styleHash = {'rtgang'               : {'lbl': 'RT-Gang',             'mrk': 'r-o'},
                     'gftp'                 : {'lbl': 'Gang-FTP',            'mrk': 'm-p'},
                     'gftp-ideal'           : {'lbl': 'Gang-FTP (Ideal)',    'mrk': 'm--p'},
                     'threaded'             : {'lbl': 'Threaded',            'mrk': 'c-D'},
                     'threaded-ideal'       : {'lbl': 'Threaded (Ideal)',    'mrk': 'c--D'},
                     'rtgsync-gpc'          : {'lbl': 'RTG-Sync(GPC)',       'mrk': 'g-^'},
                     'rtgsync-ideal-gpc'    : {'lbl': 'RTG-Sync(Ideal-GPC)', 'mrk': 'g--^'},
                     'rtgsync-bfc'          : {'lbl': 'RTG-Sync(BFC)',       'mrk': 'b-x'},
                     'rtgsync-ideal-bfc'    : {'lbl': 'RTG-Sync(Ideal-BFC)', 'mrk': 'b--x'}}

        workloadLabel = {'mixed': 'Mixed',
                         'light': 'Light',
                         'heavy': 'Heavy'}

        legendLocation = {'light': 'upper right',
                          'mixed': 'lower left',
                          'heavy': 'lower left'}

        for policy in policies:
            utils, sched = self.__stratify_data (resultsHash [policy])
            plt.plot (utils, sched, styleHash [policy]['mrk'],
                    label = styleHash [policy]['lbl'])

        plt.grid (True)
        plt.ylim (-0.1, 1.1)
        plt.xlim (1, utils [-1])
        if workloadType == 'mixed':
            plt.legend (loc = legendLocation [workloadType], ncol = 2,
                    fontsize = self.legendFz)
        plt.xlabel ('Utilization', fontsize = self.labelFz,
                fontweight = self.labelFw)
        plt.ylabel ('Schedulability', fontsize = self.labelFz,
                fontweight = self.labelFw)
        additional_title = '' if not self.tpp else ' | Tasks Per Period = %s' % (self.tpp)
        plt.title ('%s' % (workloadLabel [workloadType] + additional_title),
                fontsize = self.titleFz, fontweight = self.titleFw)

        ax = plt.gca ()
        for tick in ax.xaxis.get_major_ticks():
            tick.label1.set_fontsize(15)
            # tick.label1.set_fontweight('bold')
        for tick in ax.yaxis.get_major_ticks():
            tick.label1.set_fontsize(15)
            # tick.label1.set_fontweight('bold')

        additional_name = '' if not self.tpp else '_t%s' % (self.tpp)
        plt.savefig ('%s_c%d%s.pdf' % (workloadType, M, additional_name), bbox_inches = 'tight')

        return

    def __stratify_data (self, utilizationHash):
        utils = sorted (utilizationHash.keys ())
        sched = [utilizationHash [u] for u in utils]

        return utils, sched
