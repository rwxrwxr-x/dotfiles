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
export EDITOR=/usr/local/bin/vim
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

alias c='clear'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -ah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias cp='cp -i'
alias free='free -hm'
alias grep='grep --colour=always'
alias uptime='uptime -p'
alias ping='ping -c 5'
alias top='htop'
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
alias wine32='WINEPREFIX='/home/quanttyo/.wine32' WINEARCH=win32'
alias tux='uptime -p | cowsay -f tux'
alias rlogs='sudo tail -f /var/log/messages'
alias neofetch='neofetch --image'
alias tty-clock='tty-clock -c -C 5 -f %d/%m/%y'
alias df='df -h'
