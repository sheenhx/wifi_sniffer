# wifi_sniffer
CC3200 based wifi sniffer with FTDI UART data channel

# 1. Introduction

Works with [armhf-concentrator](https://hub.docker.com/r/sheenhx/armhf-concentrator/) docker container.

Implemented the in-band control via USB port

# 2. Usage

Enumerate the USB port in Linux:

```
# modprobe ftdi_sio
# echo 0451 c32a > /sys/bus/usb-serial/drivers/ftdi_sio/new_id
```

Then it will automatically run when the Green LED is bliking well.

# 3. Python test script

```
#!/usr/bin/python
# -*- coding: iso-8859-15 -*-
import sys, serial
import logging
from time import *
import datetime, string

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)

port = sys.argv[1]
#Baud rate should be: 9600 or 115200
speed = sys.argv[2]
cfg = sys.argv[3]

def send_cmd() :
	ser.write(""+cfg+"\n" )
	ret = ser.readline()
	logging.debug( ret )
	ser.close()

ser = serial.Serial(port,speed, timeout = 1) # add timeout to make sure that error will return when nodes are dead
if ser.isOpen():
    ser.close()
ser.open()
ser.isOpen()


send_cmd()

```

When you type ***CFG***, the CC3200 will stop and wait for more configurations. LED will stop blinking.
When you type ***RESTART***, it will continue to run. LED blinks.

```
# python test.py /dev/ttyUSB1 115200 CFG+CH=1
```
```
# python test.py /dev/ttyUSB1 115200 RESTART
```