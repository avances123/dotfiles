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

export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"



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

if [ -f ~/src/dotfiles/lib/git-prompt.sh ]; then
	. ~/src/dotfiles/lib/git-prompt.sh
fi



# http://thomashunter.name/blog/git-colored-output-shortcut-commands-autocompletion-and-bash-prompt/
if [ -f ~/src/dotfiles/lib/git-completion.bash ]; then
	. ~/src/dotfiles/lib/git-completion.bash
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




# android http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
export PATH=/home/fabio/android-sdk-linux:$PATH



