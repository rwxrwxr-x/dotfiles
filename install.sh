#!/bin/zsh
run(){
if [ -z $1]; then
    echo "Parameters required:
        \t git user.name
        \t git user.email
        \t app store login"
    return
fi

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | zsh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

ln -f zshrc $HOME/.zshrc
source ~/.zshrc
mkdir ~/repos

sudo nvram SystemAudioVolume=" "
brew update --verbose
brew tap Homebrew/cask-fonts
brew install visual-studio-code font-jetbrains-mono iterm2 mas git neovim
brew install --cask font-hack-nerd-font
brew install font-jetbrains-mono-nerd-font
brew install --cask pycharm forklift telegram-desktop eul docker postgresql
mas signin $3
mas install 441258766
xcode-select --install

ln -f vscode_settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -f neofetch_config.conf $HOME/.config/neofetch/config.conf
ln -f iterm2 $HOME/Library/Prefrerences/com.googlecode.iterm2.plist

zsh ./vscode_extensions.sh
zsh ./macos_env


mkdir $HOME/.config/nvim
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -f init.vim $HOME/.config/nvim/init.vim
ln -f coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -f gitconfig $HOME/.gitconfig
git-config --global user.name $1
git-config --global user.email $2
nvim +PlugInstall +qall > /dev/null
}

"$@"