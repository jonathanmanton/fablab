from Tkinter import *
import serial
import struct

def printit(num, value):
	msg = struct.pack('>BH', num, int(value))
	ser.write(msg)

	print struct.unpack('>BH', msg)

def print_1(value):
	printit(1, value)

def print_base(value):
	printit(3, value)

def print_elbow(value):
	printit(4, value)

def print_wrist(value):
	printit(5, value)

def print_gripper(value):
	printit(6, value)

ser = serial.Serial('/dev/cu.usbserial-A900adWw', 9600)
master = Tk()

w = Scale(master, label="shoulder", from_=600, to=2400, orient=HORIZONTAL, command=print_1)
w.set(640)
w.pack()

w = Scale(master, label="base", from_=600, to=2400, orient=HORIZONTAL, command=print_base)
w.set(1500)
w.pack()

w = Scale(master, label="elbow", from_=600, to=2400, orient=HORIZONTAL, command=print_elbow)
w.set(1100)
w.pack()

w = Scale(master, label="wrist", from_=600, to=2400, orient=HORIZONTAL, command=print_wrist)
w.set(1730)
w.pack()

w = Scale(master, label="gripper", from_=600, to=2400, orient=HORIZONTAL, command=print_gripper)
w.set(1500)
w.pack()

mainloop()
ser.close()
