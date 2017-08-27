# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# some more ls aliases
alias ll='ls -lrth'
alias la='ls -A'
# http://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-parameter
busca() { find . | grep "$1" ;}
alias gnome-terminal='gnome-terminal --window --maximize'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias rsync='rsync -av --progress'
alias dmesg='journalctl --dmesg'
alias msfconsole="msfconsole --quiet -x \"db_connect msf\""




# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if [ -f ~/.bashrc_curro ]; then
    . ~/.bashrc_curro
fi



# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/src/dotfiles/git/git-prompt.sh ]; then
	. ~/src/dotfiles/git/git-prompt.sh
fi



# http://thomashunter.name/blog/git-colored-output-shortcut-commands-autocompletion-and-bash-prompt/
if [ -f ~/src/dotfiles/git/git-completion.bash ]; then
	. ~/src/dotfiles/git/git-completion.bash
fi
# Bash history management
shopt -s histappend
HISTCONTROL=ignoredups
HISTSIZE=20000
HISTFILESIZE=2000000
export PROMPT_COMMAND='history -a'



if [ -f /usr/share/cdargs/cdargs-bash.sh ]; then
	source /usr/share/cdargs/cdargs-bash.sh
fi




# github

#alias gist="/home/fabio/src/gist/gist"
export EDITOR='vim'


# https://wiki.archlinux.org/index.php/SSH_keys_(Espa%C3%B1ol)#Recuerde_la_frase-de-paso
#eval `keychain -Q -q --eval --agents ssh id_rsa`


# virtualenvs

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    . /usr/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src


#NVM
source /usr/share/nvm/init-nvm.sh




# FASD
eval "$(fasd --init auto)"


# android http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
export PATH=/home/fabio/android-sdk-linux:$PATH

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)



[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

# PROMPT
green=$(tput setaf 2)
cyan=$(tput setaf 6)
magenta=$(tput setaf 5)
blue=$(tput setaf 4)
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)
hostname=$(hostname)
case $hostname in
	fa-big)
		export PS1='\u@\[$cyan\]\h\[$reset\]:\w\[$blue\]$(__git_ps1)\[$reset\] \$ '
	;;
	fa-server)
		export PS1='\u@\[$red\]\h\[$reset\]:\w\[$blue\]$(__git_ps1)\[$reset\] \$ '
	;;

	fa-work)
		export PS1='\u@\[$green\]\h\[$reset\]:\w\[$blue\]$(__git_ps1)\[$reset\] \$ '
	;;
	fa-laptop)
		export PS1='\u@\[$magenta\]\h\[$reset\]:\w\[$blue\]$(__git_ps1)\[$reset\] \$ '
	;;

esac




