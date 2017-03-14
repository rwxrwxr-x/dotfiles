#!/usr/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi


xset b off
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -option ctrl:nocaps
session=${1:-i3}
#export QT_QPA_PLATFORMTHEME=qt5ct ##fucking qt
case $session in
    i3)
        source ~/.config/x11/i3.sh;;
    awesome)
        source ~/.config/x11/awesome.sh;;
    # no known session, try to run command
    *)
        exec $1;;
esac
