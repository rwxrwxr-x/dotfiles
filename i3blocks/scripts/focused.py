

import subprocess

def run(arg):
   # from subprocess import Popen,PIPE
    return subprocess.Popen(arg,stdout = subprocess.PIPE,stderr = subprocess.PIPE,shell = True).communicate()[0].decode("utf-8").strip()
icon = "  "
formatinit = "<span background=\"#002b36\" foreground=\"#268bd2\"> "
formatend = " </span>"
def mpc():
    raw = run("mpc status")
    if raw == "":
        return "mpd: connection refused"
    else:
        song = raw.splitlines()[0]
        timeraw = raw.splitlines()[1]; time = timeraw[timeraw.find("/")+5:timeraw.find("/")+15]
        return song + time
print(formatinit + icon + mpc() + formatend)
