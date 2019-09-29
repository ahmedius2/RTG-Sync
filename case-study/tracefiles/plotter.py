import numpy as np
from matplotlib import mlab
import matplotlib.pyplot as plt

class Plotter:
    def __init__ (self):
        self.data = {}
        self.labelFz = 'large'
        self.labelFw = 'bold'
        self.legendFz = 'large'
        self.legendFw = 'light'

        return

    def plot (self, plotName, dataHash, lineStyles, plotOrder):
        numOfBins = 1000

        for f in plotOrder:
            for gang in dataHash [f]:
                sLockTimes = sorted (dataHash [f][gang])
                counts, bin_edges = np.histogram (sLockTimes, bins = numOfBins,
                                                normed = True)
                cdf = np.cumsum (counts)
                lineStyles [f] += '' if (gang % 2) else '--'
                plt.plot (bin_edges [1:], cdf / cdf [-1], lineStyles [f], lw = 2, label = '%s-%d' % (f, gang))

        plt.grid (True)
        plt.legend (loc = 'upper center', ncol = 3, fontsize = self.legendFz)
        plt.xlim (0, 100)
        plt.ylim (-0.02, 1.15)
        plt.xlabel ('Real-Time Gang Lock Duration (msec)', fontsize = self.labelFz, fontweight = self.labelFw)
        plt.ylabel ('Likelihood of Occurence (CDF)', fontsize = self.labelFz, fontweight = self.labelFw)

        plt.show ()
        # plt.savefig ('%s.jpg' % (plotName), bbox_inches = 'tight')

        return
