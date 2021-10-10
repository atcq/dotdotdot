#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# HISTORY
# disable dups in history
export HISTCONTROL=ignoredups

# zsh like help functionality
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x '"\eh": run-help'

# powerline prompt
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# add command not found functionality
source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/share/bash-completion/bash_completion

# export some env variables
export TERMINAL=kitty
export TERM=kitty
export EDITOR=nvim

# alias definition
alias ls="colorls --dark"
# show archlinux new, run a system upgrade
alias upgrade-yay="yay -Pw && yay -Syu"
# git alias for .files
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
