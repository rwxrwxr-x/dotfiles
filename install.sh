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

ln -f zsh/zshrc $HOME/.zshrc
ln -f zsh/profile.zsh $HOME/.profile.zsh
source ~/.zshrc
mkdir ~/repos

sudo nvram SystemAudioVolume=" "
brew update --verbose
brew tap Homebrew/cask-fonts
brew install visual-studio-code font-jetbrains-mono iterm2 mas git neovim
brew install --cask font-hack-nerd-font
brew install font-jetbrains-mono-nerd-font
brew install --cask pycharm forklift telegram-desktop eul docker postgresql
brew install girara --HEAD
brew install zathura --HEAD
mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib
mas signin $3
mas install 441258766
xcode-select --install

ln -f vscode/vscode_settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -f neofetch_config.conf $HOME/.config/neofetch/config.conf
ln -f iterm2 $HOME/Library/Prefrerences/com.googlecode.iterm2.plist
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

zsh ./vscode/vscode_extensions.sh
zsh ./macos_env


mkdir $HOME/.config/nvim
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -f neovim/init.vim $HOME/.config/nvim/init.vim
ln -f neovim/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -f gitconfig $HOME/.gitconfig
git-config --global user.name $1
git-config --global user.email $2
nvim +PlugInstall +qall > /dev/null
}

"$@"