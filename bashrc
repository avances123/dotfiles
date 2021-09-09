#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="/usr/lib/ccache/bin/:$PATH"


alias ls='ls --color=auto'
alias ll='ls -lrtah --color=auto'
alias grep='grep --color=auto'
alias "c=xclip -selection clipboard" # copy to X clipboard (register *)
alias "v=xclip -o -selection clipboard" # output copied content (paste)

# GIT
source /usr/share/git/completion/git-prompt.sh

# PYTHON
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/bin/virtualenvwrapper.sh
eval "$(pyenv init -)"


# NODE
source /usr/share/nvm/init-nvm.sh


# BASH
#shopt -s histappend
export HISTCONTROL=ignoredups
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export PROMPT_COMMAND='history -a'
export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[02;36m\]\h\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;30m\]>\[\033[00m\] '
export EDITOR='vim'
export NMON=mcdtkn
eval "$(fasd --init auto)"
source /usr/share/cdargs/cdargs-bash.sh                                                                                                                                                                                                     
source /usr/share/LS_COLORS/dircolors.sh

# ANDROID
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=/home/fabio/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH


# Configuracion optativa del usuario
if [ -f ~/.bashrc_curro ]; then
    . ~/.bashrc_curro
fi

### Bashhub.com Installation.
### This Should be at the EOF. https://bashhub.com/docs
#if [ -f ~/.bashhub/bashhub.sh ]; then
#    source ~/.bashhub/bashhub.sh
#fi
