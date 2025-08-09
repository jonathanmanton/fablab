#
# hello4imp.py
# receive and plot hello4 impulse response
# (c) Neil Gershenfeld CBA MIT
# 8/22/04
#
from Tkinter import *
import serial

WINDOW = 600
NSAMPLES = 254
MAX = 1040
eps = 0.25
saveflag = 0
index = 0
path = []
imp = []
path_filt = []
imp_filt = []

def idle(parent,canvas):
   global index, channel, path, path_filt, imp, imp_filt, saveflag
   #
   # idle routine
   #
   lo_up = ord(ser.read())
   hi_up = ord(ser.read())
   lo_dn = ord(ser.read())
   hi_dn = ord(ser.read())
   if ((lo_up == 1) & (hi_up == 2) & (lo_dn == 3) & (hi_dn == 4)):
      if (path_filt == []):
         path_filt = path
	 imp_filt = imp
      else:
         for i in range(len(path_filt)):
	    path_filt[i] = (1-eps)*path_filt[i] + eps*path[i]
         for i in range(len(imp_filt)):
	    imp_filt[i] = (1-eps)*imp_filt[i] + eps*imp[i]
      canvas.delete("path")
      canvas.create_line(path_filt,tag="path",fill="#00b000")
      if (saveflag == 1):
         file = open("out","w")
	 for i in range(len(imp_filt)):
	    file.write("%d\n"%(imp_filt[i]))
	 file.close()
	 print 'saved to "out"'
         saveflag = 0
      index = 0
      path = []
      imp = []
   else:
      value_up = 256*hi_up + lo_up
      value_dn = 256*hi_dn + lo_dn
      value = (value_up + (1023-value_dn))/2.0
      index += 1
      imp.insert(0,value)
      path.insert(0,WINDOW-value*WINDOW/float(MAX))
      path.insert(0,WINDOW-index*WINDOW/float(NSAMPLES))
   parent.after_idle(idle,parent,canvas)

def save(parent):
   global saveflag
   saveflag = 1

#
# open serial port
#
ser = serial.Serial('/dev/ttyS0',9600)
ser.setDTR()
#
# find framing
#
print "finding framing ..."
byte2 = 0
byte3 = 0
byte4 = 0
while 1:
   byte1 = byte2
   byte2 = byte3
   byte3 = byte4
   byte4 = ord(ser.read())
   if ((byte1 == 1) & (byte2 == 2) & (byte3 == 3) & (byte4 == 4)):
      break
#
# start plotting
#
root = Tk()
root.title('imp.py')
root.bind('q','exit')
root.bind('s',save)
canvas = Canvas(root, width=WINDOW, height=WINDOW, background='white')
canvas.pack()
root.after(100,idle,root,canvas)
root.mainloop()
