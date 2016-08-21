#!/usr/bin/python
import subprocess, os

def run(arg):
    return subprocess.Popen(arg, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.read().decode(encoding="UTF-8")

def getKeymap():
  raw = run(["xset", "-q"]).splitlines()[1]
  return raw[raw.find("LED ")+11:]

if getKeymap()=="00000000":
  print("us")
elif getKeymap()=="00001004":
  print("ru")

