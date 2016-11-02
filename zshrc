HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob nomatch notify correctall promptsubst
unsetopt appendhistory beep
autoload -U colors compinit
colors 
compinit

# auto startup xorg on tty1
if [[ -z $(pgrep X) && "x$(tty)" == "x/dev/tty1" ]]
then
  exec startx
fi

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
export VISUAL=/usr/local/bin/vim
export EDITOR="$VISUAL"
export SHELL=/bin/zsh
LC_CTYPE=ru_RU.UTF-8
LC_COLLATE=ru_RU.UTF-8
export LC_CTYPE LC_COLLATE

alias killall="killall --interactive --verbose"
alias free="free -t -m"
alias zsh-refresh="source ~/.zshrc"
alias zsh-edit="${EDITOR} ~/.zshrc"

alias -s {go,txt,cfg,c,cpp,rb,asm,nim,conf,d}=$(EDITOR)
alias -s {avi,mpeg,mpg,mov,m2v}=mpv
alias -s {png,jpg,gif,svg}=feh

aliac c='clear'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -ah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias cp='cp -i'
alias free='free -hm'
alias grep='grep --colour=always'
alias uptime='uptime -p'
alias ping='ping -c 5'
alias fping='ping -c 100 -s.2'
alias top='htop'
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
alias tl='~/.config/scripts/tl.sh'
alias wine32='WINEPREFIX='/home/quanttyo/.wine32' WINEARCH=win32'
alias tux='uptime -p | cowsay -f tux'
alias rlogs='sudo tail -f /var/log/messages"
alias neofetch='neofetch --image'
alias friday='neofetch && df && tl"\'
alias tty-clock='tty-clock -c -C 5 -f %d/%m/%y'
alias df='df -h'
alias dfc="df -h | grep -v none | grep -v cgroup | grep -v tmpfs'
alias dug='du -h | grep ^[0-9.]*G | sort -rn'
alias dum='du -h | grep ^[0-9.]*M | sort -rn'
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias shutdown='sudo /sbin/shutdown'

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
