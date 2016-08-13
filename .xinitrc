#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi


xrdb -merge "${HOME}/.config/x11/Xresources"
xset b off
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"

session=${1:-i3}

case $session in
    i3)
        source ~/.config/x11/xi3.sh;;
    xfce)
        startxfce4;;
    # no known session, try to run command
    *)
        exec $1;;
esac
