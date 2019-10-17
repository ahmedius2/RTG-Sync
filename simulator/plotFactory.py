import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt

class Plotter:
    def __init__ (self):
        self.data = {}
        self.labelFz = 'large'
        self.labelFw = 'bold'
        self.legendFz = 'medium'

        return

    def create_schedulability_plot (self, resultsHash):
        fig = plt.figure (figsize = (7, 5))

        for policy in resultsHash:
            utils, sched = self.__stratify_data (resultsHash [policy])
            plt.plot (utils, sched, 'r-o', label = policy.capitalize ())

        plt.grid (True)
        plt.legend (loc = 'upper center', ncol = 2, fontsize = self.legendFz)
        plt.xlim (1, utils [-1])
        plt.ylim (0, 1.1)
        plt.xlabel ('Utilization', fontsize = self.labelFz, fontweight = self.labelFw)
        plt.ylabel ('Schedulability', fontsize = self.labelFz, fontweight = self.labelFw)

        plt.show ()

        return

    def __stratify_data (self, utilizationHash):
        utils = sorted (utilizationHash.keys ())
        sched = [utilizationHash [u] for u in utils]

        return utils, sched
