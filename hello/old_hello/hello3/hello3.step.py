#
# hello3.step.py
# receive and plot step response
# Neil Gershenfeld CBA MIT
# 10/29/05
#
from Tkinter import *
import serial

WINDOW = 600
NSAMPLES = 254
MAX = 1040
eps = .9
saveflag = 0
index = 0
path = []
step = []
path_filt = []
step_filt = []
baseline = []

def idle(parent,canvas):
   global index, channel, baseline, path, path_filt, step, step_filt, saveflag
   #
   # idle routine
   #
   eps = float(sfilter.get())
   lo_dn = ord(ser.read())
   hi_dn = ord(ser.read())
   lo_up = ord(ser.read())
   hi_up = ord(ser.read())
   if ((lo_dn == 1) & (hi_dn == 2) & (lo_up == 3) & (hi_up == 4)):
      if (path_filt == []):
         path_filt = path
	 step_filt = step
      else:
         for i in range(len(path_filt)):
	    path_filt[i] = (1-eps)*path_filt[i] + eps*path[i]
         for i in range(len(step_filt)):
	    step_filt[i] = (1-eps)*step_filt[i] + eps*step[i]
      canvas.delete("path")
      canvas.create_line(path_filt,tag="path",width=3,fill="#00b000")
      if (baseline != []):
         canvas.delete("baseline_path")
         canvas.create_line(baseline,tag="baseline_path",width=3,fill="#b00000")
      canvas.itemconfigure("y0",text="y[0]: %.2f"%step_filt[0])
      canvas.itemconfigure("y1",text="y[1]: %.2f"%step_filt[1])
      canvas.itemconfigure("y-1",text="y[-1]: %.2f"%step_filt[-1])
      canvas.coords('x0',0,.95*WINDOW,step_filt[0],WINDOW)
      if (saveflag == 1):
         file = open(soutfile.get(),"w")
	 for i in range(len(step_filt)):
	    file.write("%f\n"%(step_filt[i]))
	 file.close()
	 print 'saved to '+soutfile.get()
         saveflag = 0
      index = 0
      path = []
      step = []
   else:
      value_up = 256*hi_up + lo_up
      value_dn = 256*hi_dn + lo_dn
      value = (value_up + (1023-value_dn))/2.0
      index += 2
      step.insert(0,value)
      path.insert(0,WINDOW-value*WINDOW/float(MAX))
      path.insert(0,WINDOW-index*WINDOW/float(NSAMPLES))
   parent.after_idle(idle,parent,canvas)

def save_data(parent):
   global saveflag
   saveflag = 1

def store_baseline(parent):
   global path_filt, baseline
   baseline = []
   for i in range(len(path_filt)):
      baseline.append(path_filt[i])

#
# open serial port
#
ser = serial.Serial('/dev/ttyUSB0',9600)
#ser = serial.Serial('/dev/ttyS0',9600)
#ser = serial.Serial('COM6',9600)
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
      print "start plotting"
      break
#
# start plotting
#
root = Tk()
root.title('hello3.step.py')
root.bind('q','exit')

canvas = Canvas(root, width=WINDOW, height=WINDOW, background='white')
canvas.create_text(.2*WINDOW,.9*WINDOW,font=("Helvetica", 24),tags="y0",fill="#0000b0")
canvas.create_text(.5*WINDOW,.9*WINDOW,font=("Helvetica", 24),tags="y1",fill="#0000b0")
canvas.create_text(.8*WINDOW,.9*WINDOW,font=("Helvetica", 24),tags="y-1",fill="#0000b0")
canvas.create_rectangle(0,.95*WINDOW,0,WINDOW, tags='x0', fill='#b00000')
canvas.pack()

ioframe = Frame(root)
Label(ioframe, text=" filter (0-1):").pack(side="left")
sfilter = StringVar()
sfilter.set(str(eps))
Entry(ioframe, width=5, textvariable=sfilter).pack(side="left")
Label(ioframe, text=" ").pack(side="left")
basebtn = Button(ioframe, text="store baseline")
basebtn.bind('<Button-1>',store_baseline)
basebtn.pack(side="left")
Label(ioframe, text=" ").pack(side="left")
savebtn = Button(ioframe, text="save data")
savebtn.bind('<Button-1>',save_data)
savebtn.pack(side="left")
Label(ioframe, text=" output file:").pack(side="left")
soutfile = StringVar()
soutfile.set("out.dat")
Entry(ioframe, width=10, textvariable=soutfile).pack(side="left")
Label(ioframe, text=" ").pack(side="left")
quitbtn = Button(ioframe, text="quit")
quitbtn.bind('<Button-1>','exit')
quitbtn.pack(side="left")
ioframe.pack()

root.after(100,idle,root,canvas)
root.mainloop()
