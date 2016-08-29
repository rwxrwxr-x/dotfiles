#!/usr/bin/env python

# imports
import subprocess

# settings
NAME              = "lemonbar"
WIDTH             = 1600
HEIGHT            = 24
MONITOR_WIDTH     = 1600
UNDERLINE_PIXELS  = 3
COLOR_BACKGROUND  = "#dd111111"
COLOR_FOREGROUND  = "#ffaaaaaa"
FONT1             = "HelveticaNeue-10"
FONT2             = "FontAwesome-10"
ACTIONS           = 20
MONITORS          = 1
CONFIG_LOCATION   = "~/.config/lemonbar/"
TYPE              = "lem-rtm"
# Available types:
#   lem-mpd  -- for music player demon
#   lem-rtm -- for rhythmbox music player
#   lem -- without music player
def run(arg):
  return subprocess.Popen(arg,stdout = subprocess.PIPE,stderr = subprocess.PIPE,shell = True).communicate()[0].decode("utf-8").strip()

# entry points
def wrapper():
  for i in range(MONITORS):
    x = i * MONITOR_WIDTH
    geometery = "{}x{}+{}".format(WIDTH, HEIGHT, x)
    # create the cmd to execute
    cmd = "python -u {}{}.py| lemonbar -p -n \"{}\" -g \"{}\" -B \"{}\" -F \"{}\" -a {} -u {} -f \"{}\" -f \"{}\" | sh".format(
      CONFIG_LOCATION,
      TYPE,
      NAME,
      geometery,
      COLOR_BACKGROUND,
      COLOR_FOREGROUND,
      ACTIONS,
      UNDERLINE_PIXELS,
      FONT1,
      FONT2
    )
    run(cmd)
def main():
  ps = run("pidof lemonbar")
  if run == "": wrapper()
  else:
    run("killall lemonbar")
    wrapper()

main()
