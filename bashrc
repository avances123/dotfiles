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
export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[02;36m\]\h\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;36m\]>\[\033[00m\] '
export EDITOR='vim'
eval "$(fasd --init auto)"
alias v='f -e vim' # quick opening files with vim


# ANDROID
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=/home/fabio/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
