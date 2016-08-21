#!/usr/bin/python
import time, subprocess, os

# Search your device in "pactl list sinks" output, and change SoundDev on "name" of device
# For example:
# Audiodevice №3
#    Состояние: IDLE
#    Имя: alsa_output.usb-Logitech_Logitech_USB_Headset-00.analog-stereo
#    Description: Logitech USB Headset
#    Driver: module-alsa-card.c

SoundDev =  "alsa_output.usb-Logitech_Logitech_USB_Headset-00.analog-stereo"


def run(arg):
    return subprocess.Popen(arg, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.read().decode(encoding="UTF-8")

def searchMethod():
  raw = run(["pactl", "list", "sinks"]).splitlines()[8]
  return raw

def device(dev,find):
  raw   = run(["pactl","list","sinks"]).splitlines()
  y = 0
  x = 0
  n = 0
  for x in range (0,150):
      if dev in raw[x]:
        y = x
        for y in range (x,150):
          if find in raw[y]:
            n = y
            break
        break
  return n+1

def volume(num):
  raw   = run(["pactl", "list", "sinks"]).splitlines()[num:num+1][0]
  value = raw[raw.find("/ ")+2:raw.find("%")]
  return value + "%"

print(volume(device(SoundDev,searchMethod())))