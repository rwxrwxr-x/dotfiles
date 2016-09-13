# start i3 window manager 
# source this script from xinitrc

# compositor and wallpaper
compton --config ~/.config/compton/compton.conf -b --backend glx --vsync opengl-swc &
#feh --randomize --bg-fill ~/.bg/* &
feh --bg-fill ~/.bg/bg.png &

exec i3
