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
cp -i -R ncmpcpp/ $homee/.ncmpcpp/
cp -i -R bg/ $homee/.bg/
cp -i -R .tmux.conf $HOME
cp -i -R .Xdefaults $HOME
cp -i -R .xinitrc $HOME
cp -i -R .zshrc $HOME
cp -i -R fonts/ $HOME/.fonts/
echo "end"
sleep 1
cd $HOME/.fonts
echo $(pwd)
fc-cache -vf

