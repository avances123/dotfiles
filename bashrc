#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lrtah --color=auto'
alias grep='grep --color=auto'

# GIT
source /usr/share/git/completion/git-prompt.sh

# PYTHON
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/bin/virtualenvwrapper.sh


# NODE
source /usr/share/nvm/init-nvm.sh


# BASH
#shopt -s histappend
export HISTCONTROL=ignoredups
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export PROMPT_COMMAND='history -a'
export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;30m\]\h\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;30m\]>\[\033[00m\] '
export EDITOR='vim'
eval "$(fasd --init auto)"

