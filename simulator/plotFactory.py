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

    def create_schedulability_plot (self, resultsHash, workloadType):
        fig = plt.figure (figsize = (7, 5))
        styleHash = {'rtgang': 'r-o', 'rtgsynch': 'c-^'}

        for policy in resultsHash:
            utils, sched = self.__stratify_data (resultsHash [policy])
            plt.plot (utils, sched, styleHash [policy], label = policy.capitalize ())

        plt.grid (True)
        plt.legend (loc = 'upper center', ncol = 2, fontsize = self.legendFz)
        plt.xlim (1, utils [-1])
        plt.ylim (0, 1.1)
        plt.xlabel ('Utilization', fontsize = self.labelFz, fontweight = self.labelFw)
        plt.ylabel ('Schedulability', fontsize = self.labelFz, fontweight = self.labelFw)
        plt.title ('%s Taskset' % workloadType.capitalize (),
                fontsize = self.titleFz, fontweight = self.titleFw)

        plt.savefig ('%s.pdf' % (workloadType), bbox_inches = 'tight')

        return

    def __stratify_data (self, utilizationHash):
        utils = sorted (utilizationHash.keys ())
        sched = [utilizationHash [u] for u in utils]

        return utils, sched
