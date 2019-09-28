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

        for case in plotOrder:
            sLockTimes = sorted (dataHash [case])
            counts, bin_edges = np.histogram (sLockTimes, bins = numOfBins,
                                            normed = True)
            cdf = np.cumsum (counts)
            plt.plot (bin_edges [1:], cdf / cdf [-1], lineStyles [case], lw = 2, label = case)

        plt.grid (True)
        plt.legend (loc = 'upper center', ncol = 3, fontsize = self.legendFz)
        plt.xlim (0, 20)
        plt.ylim (-0.02, 1.15)
        plt.xlabel ('Real-Time Gang Lock Duration (msec)', fontsize = self.labelFz, fontweight = self.labelFw)
        plt.ylabel ('Likelihood of Occurence (CDF)', fontsize = self.labelFz, fontweight = self.labelFw)

        plt.show ()
        # plt.savefig ('%s.jpg' % (plotName), bbox_inches = 'tight')

        return
