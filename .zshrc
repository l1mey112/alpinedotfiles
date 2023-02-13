source ~/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh

alias networks="iwctl station wlan0 scan && iwctl station wlan0 get-networks"
alias connect="iwctl station wlan0 connect"

autoload -U colors && colors
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

PS1='%2C%# '

#set history size
export HISTSIZE=100000
#save history after logout
export SAVEHIST=100000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY 

setopt completealiases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
