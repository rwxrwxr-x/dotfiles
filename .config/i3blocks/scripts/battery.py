#!/usr/bin/python
import time, subprocess, os

# COLORS
GRAY     = "%{F#555}"
RED      = "%{F#FF0000}"


# BATTERIES
B_CRITICAL = ""   #   5%
B_LOW      = ""   #  25%
B_HALF     = ""   #  50%
B_ALMOST   = ""   #  75%
B_FULL     = ""   # 100%
WIRED      = ""

def run(arg):
  return subprocess.Popen(arg, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.read().decode(encoding="UTF-8")


def battery():
  raw     = run(["acpi"])[11:-1]
  icon    = ""
  time    = ""
  time = raw[raw.find("%,")+4:raw.find("%,")+8]
  if "unknown" in raw:
    icon = WIRED + " "
    if time == "unti": time = ""
  elif "Full" in raw:
    icon = WIRED
    time = ""
  elif "remaining" in raw:
    percent = int(raw[raw.find(" ")+1:raw.find("%")])
    if   percent <= 5:   icon = B_CRITICAL
    elif percent <= 25:  icon = B_LOW
    elif percent <= 50:  icon = B_HALF
    elif percent <= 75:  icon = B_ALMOST
    elif percent <= 100: icon = B_FULL
    icon += " "
    if icon == B_LOW + " ": return RED + icon + time
  return icon + time

print(battery())