HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob nomatch notify correctall promptsubst
unsetopt appendhistory beep
autoload -U colors compinit
colors 
compinit


# customize prompt

[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman

eval $(dircolors ~/.dircolors)
autoload -U pick-web-browser

alias -s {go,txt,cfg,c,cpp,rb,asm,nim,conf,d}=subl3
alias -s {avi,mpeg,mpg,mov,m2v}=vlc
alias -s {png,jpg,gif,svg}=feh

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -ah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias cp='cp -i'
alias df='df -h'
alias free='free -hm'
alias grep='grep --colour=always'
alias uptime='uptime -p'
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
alias neofetch="~/git/neofetch/neofetch && scrot -d 5 'tl.png'"
alias wine32="WINEPREFIX='/home/wearemad/.wine32' WINEARCH=win32"
alias tux="uptime -p | cowsay -f tux"

alias S='sudo pacman -S'
alias Sc='echo "\n" | sudo pacman -Sc'
alias Ss='sudo pacman -Ss'
alias Syu='sudo pacman -Syu'
alias Syua='yaourt -Syua'
alias Q='sudo pacman -Q'
alias R='sudo pacman -R'
alias Rsc='sudo pacman -Rsc'
alias Rsn='sudo pacman -Rsn'
alias rbg='~/.rbg'
#alias nvidia='vblank_mode=0 optirun -b primus'


# extract <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export PROMPT="%{$fg[green]%}% %n@%m %{$fg_bold[blue]%}% %~${gitprompt} %{$fg[white]%}% $ %{$reset_color%}%u"
GOPATH=/home/wearemad/.go
export GOPATH
PATH=$PATH:$GOPATH/bin
