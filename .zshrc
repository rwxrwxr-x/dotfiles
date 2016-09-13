HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob nomatch notify correctall promptsubst
unsetopt appendhistory beep
autoload -U colors compinit
colors 
compinit



### OH-MY-ZSH!
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="gnzh"
DISABLE_AUTO_UPDATE="true"
plugins=(git archlinux colored-man-pages colorize extract sudo systemd themes)
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh
## OH-MY-ZSH end

# customize prompt
 SPROMPT="Исправить %R на %r? <(Y)es/(N)o/(E)dit/(A)bort>"
 export EDITOR="subl3"



[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman

eval $(dircolors ~/.dircolors)
autoload -U pick-web-browser





alias killall="killall --interactive --verbose"
alias free="free -t -m"
alias zsh-refresh="source ~/.zshrc"
alias zsh-edit="${EDITOR} ~/.zshrc"

#alias -s {go,txt,cfg,c,cpp,rb,asm,nim,conf,d}=subl3
alias -s {avi,mpeg,mpg,mov,m2v}=mpv
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
alias tl="~/.config/tl.sh"
alias wine32="WINEPREFIX='/home/quanttyo/.wine32' WINEARCH=win32"
alias tux="uptime -p | cowsay -f tux"
alias rlogs="sudo tail -f /var/log/messages"

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

#export PROMPT="%{$fg[green]%}% %n@%m %{$fg_bold[blue]%}% %~${gitprompt} %{$fg[white]%}% $ %{$reset_color%}%u"
export SHELL=/bin/zsh