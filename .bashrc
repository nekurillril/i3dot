#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

alias nekofetch='neofetch --ascii ~/.config/neofetch/neko'

nekofetch

alias ls='ls --color=auto -a'
alias ll='ls --color=auto -l'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
