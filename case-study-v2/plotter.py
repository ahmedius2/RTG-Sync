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

    def create_cdf_plot (self, data, styles, axes, order):
        numOfBins = 1000
        fig = plt.figure (figsize = (6, 5))

        for scn in order ['l1']:
            for dnn in order ['l2']:
                name = styles [scn][dnn]['name']
                style = styles [scn][dnn]['style']
                jobDurations = sorted (data [scn][dnn])[:-2]
                counts, bin_edges = np.histogram (jobDurations,
                        bins = numOfBins, density = True)
                cdf = np.cumsum (counts)
                plt.plot (bin_edges [1:], cdf / cdf [-1], style, lw = 2,
                        label = name)

        plt.grid (True)

        # Manual annotation on the final plot
        plt.plot ([8.48], [0.51], marker = 'o', markersize = 5, color = 'green')
        plt.annotate (u'\u03bc = 8.48', [8.4, 0.51], [7.0, 0.5])
        plt.plot ([8.91], [0.56], marker = 'o', markersize = 5, color = 'blue')
        plt.annotate (u'\u03bc = 8.91', [9.0, 0.56], [9.1, 0.55])
        plt.plot ([11.31], [0.498], marker = 'o', markersize = 5, color = 'red')
        plt.annotate (u'\u03bc = 11.31', [11.31, 0.49], [10.56, 0.44])

        plt.plot (axes ['x']['lim'], [1, 1], 'k--', lw = 1)
        plt.legend (loc = 'upper center', ncol = 3, fontsize = self.legendFz)
        plt.xlim (axes ['x']['lim'])
        plt.ylim (axes ['y']['lim'])
        plt.xlabel (axes ['x']['lbl'], fontsize = self.labelFz,
                fontweight = self.labelFw)
        plt.ylabel (axes ['y']['lbl'], fontsize = self.labelFz,
                fontweight = self.labelFw)

        plt.savefig ('cdf.pdf', bbox_inches = 'tight')

        return
