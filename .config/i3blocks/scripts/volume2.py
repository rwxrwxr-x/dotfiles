#!/usr/bin/python
import time, subprocess, os

def run(arg):
  	return subprocess.Popen(arg, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.read().decode(encoding="UTF-8")

def volume():
	raw   = run(["pactl", "list", "sinks"]).splitlines()[64:65][0]
	value = raw[raw.find("/ ")+2:raw.find("%")]
	return value + "%"

print(volume())