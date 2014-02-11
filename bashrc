# # Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH"

# # Check the OS type
# # Adapted from Nicolas Martyanoff's answer at
# # http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
# platform='unknown'
# unamestr=`uname`

# if [[ "$unamestr" == 'Linux' ]]; then
#    platform='linux'
# elif [[ "$unamestr" == 'Darwin' ]]; then
#    platform='darwin'
# fi

# # Linux specfic
# if [[ $platform == 'linux' ]]; then
#   alias ls='ls --color=auto'
# fi

# # OS X specfic
# if [[ $platform == 'darwin' ]]; then
#   # # PATH like a bawss
#   #       PATH=/opt/local/bin
#   # PATH=$PATH:/opt/local/sbin
#   # PATH=$PATH:/bin
#   # PATH=$PATH:~/.rvm/bin
#   # PATH=$PATH:~/code/git-friendly

#   # # To use Homebrew's directories rather than ~/.rbenv add to your profile
#   # export RBENV_ROOT=/usr/local/var/rbenv
#   # # To enable shims and autocompletion add to your profile
#   # #export RBENV_ROOT="${HOME}/.rbenv"
#   # if [ -d "${RBENV_ROOT}" ]; then
#   #   export PATH="${RBENV_ROOT}/bin:${PATH}"
#   #   eval "$(rbenv init -)"
#   # fi
#   export PATH
# fi

# Color for manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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

# check if we are local or remote via ssh. if remote, use red colours.
if [ -n "$SSH_CLIENT" ]; then
    # connecting via ssh, use red coloured prompt
    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
    else
        PS1="\[\033[31m\][\w]\[\033[0m\]\n\[\033[1;33m\]\u\[\033[1;31m\]-> \[\033[0m\]"
    fi
else
    # local coloured prompt
    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1="\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
    fi
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

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

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