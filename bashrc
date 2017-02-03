# PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

if [ -d /sbin ] ; then
    PATH=/sbin:"${PATH}"
fi

if [ -d /usr/local/bin ] ; then
    PATH=/usr/local/bin:"${PATH}"
fi


# LANGUAGE
export LANG LC_MESSAGES LC_CTYPE EDITOR TERM
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LESSCHARSET="UTF-8"
export LANGUAGE="en_US.UTF-8"


# UI
PS1="[\w]\\$ "
EDITOR=vim
TERM=xterm
SUPPORTED="en_US.UTF-8"
SYSFONT="lat0-sun16"
export CLICOLOR=1

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='\u@\h:\w\$ ' 
    ;;
*)
    PS1='\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi


# Alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
