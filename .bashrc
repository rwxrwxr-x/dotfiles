#
# ~/.bashrc
#     bash configuration file

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


##################
## Color Codes  ##
##################
# reset:
Reset='\e[0m'

# Regular colors:
Black='\e[0;30m'
Red='\e[0;31m'
Green='\e[0;32m'
Yellow='\e[0;33m'
Blue='\e[0;34m'
Purple='\e[0;35m'
Cyan='\e[0;36m'
White='\e[0;37m'

# Bold
BBlack='\e[1;30m'  
BRed='\e[1;31m'    
BGreen='\e[1;32m'  
BYellow='\e[1;33m' 
BBlue='\e[1;34m'   
BPurple='\e[1;35m' 
BCyan='\e[1;36m'   
BWhite='\e[1;37m'  

# Background
On_Black='\e[40m'  
On_Red='\e[41m'    
On_Green='\e[42m'  
On_Yellow='\e[43m' 
On_Blue='\e[44m'   
On_Purple='\e[45m' 
On_Cyan='\e[46m'   
On_White='\e[47m'  

# customize prompt
#PS1='[\u@\h \W]\$ 
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
PS1="\[$BYellow\]\u@\h \[$Reset\](\[$Green\]\w\[$Reset\])\$ "
# PROMT


# /PROMT


# Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

export EDITOR='nano'
export PAGER='less'
