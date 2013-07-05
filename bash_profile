# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# include .gitrc if it exists
if [ -f ~/.gitrc ]; then
    . ~/.gitrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

if [ -d /sbin ] ; then
    PATH=/sbin:"${PATH}"
fi     

PS1="[\w]\\$ "
#LANG=zh_CN.UTF-8
#LC_MESSAGES=en_US.UTF-8
#LC_CTYPE=zh_CN.GBK
EDITOR=vim
TERM=linux
export LANG LC_MESSAGES LC_CTYPE EDITOR TERM
export CLICOLOR=1
export PATH=/usr/local/bin:$PATH
export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN.UTF-8"
SUPPORTED="zh_CN.UTF-8"
SYSFONT="lat0-sun16"
