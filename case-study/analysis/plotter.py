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

    def plot (self, plotName, gang, dataHash, lineStyles, gangNames, plotOrder):
        fig = plt.figure (figsize = (7, 5))
        numOfBins = 1000
        names = {'rtgsynch': 'RTG-Synch (Full)', 'grand': 'RT-Gang (Sync)', \
                'nosync': 'RTG-Synch (No-Sync)', 'rtgang': 'RT-Gang'}

        for f in plotOrder:
            sLockTimes = sorted (dataHash [f][gang])[5:-5]
            counts, bin_edges = np.histogram (sLockTimes, bins = numOfBins,
                                            normed = True)
            cdf = np.cumsum (counts)
            marker = '' #'-^' if (gang % 2) else '-o'
            plt.plot (bin_edges [1:], cdf / cdf [-1], lineStyles [f] + marker, lw = 2, label = '%s' % (names [f]))

        plt.grid (True)
        plt.plot ([0, 100], [1, 1], 'k--')
        plt.legend (loc = 'upper center', ncol = 4, fontsize = self.legendFz)
        plt.xlim (0, 100)
        plt.ylim (0, 1.20)
        plt.xlabel ('Gang Lock Duration Per Period (msec)', fontsize = self.labelFz, fontweight = self.labelFw)
        plt.ylabel ('CDF (%s)' % (gangNames [gang]), fontsize = self.labelFz, fontweight = self.labelFw)

        plt.savefig ('%s_%s.pdf' % (plotName, gangNames [gang]), bbox_inches = 'tight')
        # plt.savefig ('%s_%s.png' % (plotName, gangNames [gang]))

        return
