#!/usr/bin/env python
from numarray import *
import Gnuplot
from scipy.io import read_array
skip = 1
skim = read_array("skimtop")
skim = take(skim,arange(0,len(skim),skip))
whole = read_array("wholetop")
whole = take(whole,arange(0,len(whole),skip))
cream = read_array("creamtop")
cream = take(cream,arange(0,len(cream),skip))
#y = y[:,0]/1024.0
x = arange(len(skim))
#z = concatenate((outerproduct(x,1),outerproduct(y,1)),axis=1)
g = Gnuplot.Gnuplot()
g('set style data lines')
#g('set xlabel "{/Symbol m}sec"')
#g('set xrange [0:400]')
#g('set ylabel "{step response}"')
#g('set yrange [0:1]')
#g.plot(cream)
g.plot(skim,whole,cream)
#g.plot(z)
g('set term post "Helvetica" 20 lw 2')
g.hardcopy('out.ps')
#os.system('gv out.ps')

#import sys
#sys.exit()
#g('set ylabel "{/Times=40 step response}"')
#from scipy import gplt
#gplt.plot(y)
#from TableIO import *
#x = readColumns("out","#",[0])[0]
