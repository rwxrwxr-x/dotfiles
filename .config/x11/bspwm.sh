# start bspwm
# source this script from xinitrc

# compositor and wallpaper
xrdb ~/.config/x11/Xresources &
feh --randomize --bg-fill ~/.bg/* &
sxhkd -c ~/.config/sxhkd/sxhkdrc &

exec bspwm
