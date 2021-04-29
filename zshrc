export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
plugins=(colored-man-pages colorize themes forklift cp dotenv docker)
source $ZSH/oh-my-zsh.sh

repos="$HOME/repos"

export EDITOR="nvim"

alias zreload="ln -f $HOME/repos/dotfiles/zshrc $HOME/.zshrc && source ~/.zshrc"
alias zedit="${EDITOR} ~/.zshrc"
alias python="python3"
alias pip="pip3"
alias c='clear'
alias cc='code .'
alias ccreload='ln -f vscode_settings.json $HOME/Library/Application\ Support/Code/User/settings.json'
alias f='open -a Finder .'
alias fo='open -a Finder'
alias ff='open -a ForkLift .'
alias ffo='open -a ForkLift'
alias to='touch'
alias ls='gls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='gls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='gls -ah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias -- +x="chmod +x"
alias cp='cp -i'
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias ga="git add"
alias grm="git rm"
alias denv="deactivate"
alias brewi="brew install"
alias brewr="brew uninstall"
alias brews="brew search"
alias local-ip="ipconfig getifaddr en0"
alias ip="curl ipinfo.io/ip"

alias dk='docker'
alias dp='docker ps'
alias dcu='docker compose up'
alias dcd='docker compose down'
red=`tput setaf 1`
green=`tput setaf 2`



g(){
   if [[ $# -gt 0 ]]; then
      git "$@"
   else
      git status
   fi
}

more(){
   file=$1
   if [ -z $1 ]; then
      echo "${red}Parameter required${reset}\n'more .zshrc'"
      return
   fi

   if [ ! -f $1 ];then;echo "${red}File not exist.${reset}";return;fi

   if [[ -x $file ]]; then; executable="${green}yes${reset}"
      else ; executable="${red}no${reset}"
   fi

   echo "
    ${green}*${reset}NAME:            $file
    ${green}*${reset}CREATION DATE:   $(gstat -c %y $file| sed 's/^\([0-9\-]*\).*/\1/')
    ${green}*${reset}PERMISSIONS:     $(gstat -c %a $file)
    ${green}*${reset}SIZE:            $(numfmt --to=iec-i --suffix=B --format="%.3f" $(gstat --printf="%s" $file))
    ${green}*${reset}EXECUTABLE:      ${executable}
    ${green}*${reset}ENCODING:        $(file -bi $file)
    "
}

take() {
   mkdir -p $@ ; cd $@
}

repo() {
   cd $repos
}

port() {
   lsof -i :$1
}

graph() {
   git log --oneline --graph --decorate
}
clone() {
   repo_dir=$(echo $1 | awk -F'[/:]+' '{ sub("^www\.", "", $2); print $4 }' | awk -F'.' '{print $1}' | tr -d '\r' )
   git clone $1 $repos/$repo_dir ; cd $repos/$repo_dir
}

aenv() {
   if [ "$#" -eq 0 ]; then
      echo "${red}Name of env required${reset}" ; return
   fi
   if [ -d $1 ]; then
      if [ -f $1/bin/activate ]; then
         source $1/bin/activate
      else ; echo "$1/bin/activate not exists"
      fi
   fi
}
