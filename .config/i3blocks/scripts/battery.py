#!/usr/bin/python
import time, subprocess, os

# COLORS
GRAY     = "%{F#555}"
RED      = "%{F#FF0000}"


# BATTERIES
BATTERY_CRITICAL = " "   #   5%
BATTERY_LOW      = ""  #  25%
BATTERT_HALF     = ""   #  50%
BATTERY_ALMOST   = ""   #  75%
BATTERY_FULL     = " "   # 100%
WIRED      = ""

#def run(arg):
 # return subprocess.Popen(arg, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.read().decode(encoding="UTF-8")
def run(arg):
   # from subprocess import Popen,PIPE
    return subprocess.Popen(arg,stdout = subprocess.PIPE,stderr = subprocess.PIPE,shell = True).communicate()[0].decode("utf-8").strip()




def get_battery():
    icon    = ""; time    = ""
    raw     = run("acpi")[11:-1]
    time = raw[raw.find("%,")+4:raw.find("%,")+8]
    if "until" in raw:
      icon = WIRED + " "
      if time == "unti": time = ""
    elif "Unknown" in raw:
      icon = WIRED
      time = ""
    elif "Full" in raw:
      icon =  WIRED
      time = ""
    elif "remainin" in raw:
      percent = int(raw[raw.find(" ")+1:raw.find("%")])
      if   percent <= 5:   icon = BATTERY_CRITICAL
      elif percent <= 25:  icon = BATTERY_LOW
      elif percent <= 50:  icon = BATTERY_HALF
      elif percent <= 75:  icon = BATTERY_ALMOST
      elif percent <= 100: icon = BATTERY_FULL
      icon += " "
      if icon == BATTERY_LOW + " ": return icon + time
    return icon + str(time)
print(get_battery())
