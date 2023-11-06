#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

neofetch

alias ls='ls --color=auto -al'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
