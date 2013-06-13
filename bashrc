# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lrth'
alias la='ls -A'
alias gnome-terminal='gnome-terminal --window --maximize'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias rsync='rsync -av --progress'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# http://thomashunter.name/blog/git-colored-output-shortcut-commands-autocompletion-and-bash-prompt/
if [ -f ~/src/dotfiles/lib/git-completion.bash ]; then
	. ~/src/dotfiles/lib/git-completion.bash
fi
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)
PS1='\u@\[$green\]\h\[$reset\]:\w\[$blue\]$(__git_ps1)\[$reset\] \$ '

# Bash history management
HISTSIZE=2000000
HISTFILESIZE=2000000
shopt -s histappend
if [ -n "$PROMPT_COMMAND" ]; then
    export PROMPT_COMMAND="${PROMPT_COMMAND};  history -a; history -n"
else
    export PROMPT_COMMAND='history -a; history -n'
fi

# bashmarks
source /home/fabio/src/dotfiles/bashmarks/bashmarks.sh

export EC2_PRIVATE_KEY=$HOME/.aws/pk-EHLOERH4WJ54Y546X2VJKSUPQ6YG4XF2.pem
export EC2_CERT=$HOME/.aws/cert-EHLOERH4WJ54Y546X2VJKSUPQ6YG4XF2.pem
export EC2_KEYPAIR=20130123
export AWS_CREDENTIAL_FILE=$HOME/.aws/aws-credential-file.txt
export EC2_URL=https://ec2.eu-west-1.amazonaws.com

# launchpad
export DEBFULLNAME="Fabio Rueda (vizzuality)"
export DEBEMAIL="avances123@gmail.com"


# github
#alias gist="/home/fabio/src/gist/gist"
export GITHUB_USER=$(cat $HOME/.github/GITHUB_USER)
export GITHUB_PASSWORD=$(cat $HOME/.github/GITHUB_PASSWORD)
export EDITOR='vim'


PATH=/home/fabio/src/dotfiles/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "/home/fabio/.rvm/scripts/rvm" ]] && source "/home/fabio/.rvm/scripts/rvm"

