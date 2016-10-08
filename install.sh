#!/bin/bash
configpath=$HOME/.config/

echo "Copy config files"
sleep 2
mkdir -p $configpath
cp -i -R compton/ $configpath
cp -i -R htop/ $configpath
cp -i -R i3/ $configpath
cp -i -R i3blocks/ $configpath
cp -i -R neofetch/ $configpath
cp -i -R qt5ct/ $configpath
cp -i -R ranger/ $configpath
cp -i -R scripts/ $configpath
cp -i -R x11/ $configpath
cp -i -R ncmpcpp/ $HOME/.ncmpcpp/
cp -i -R bg/ $HOME/.bg/
cp -i -R tmux.conf $HOME/.tmux.conf
cp -i -R Xdefaults $HOME/.Xdefaults
cp -i -R xinitrc $HOME/.xinitrc
cp -i -R zshrc $HOME/.zshrc
cp -i -R fonts/ $HOME/.fonts/
echo "end"
sleep 1
cd $HOME/.fonts
echo $(pwd)
fc-cache -vf

