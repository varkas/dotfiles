###########################################################################
# Environment Variables
###########################################################################

export EDITOR=vim
export HISTCONTROL=ignoreboth;
export HISTIGNORE=l:ll:h:ls:lt
export HISTSIZE=100000
export HISTFILESIZE=9999999

###########################################################################
# Init
###########################################################################

# use my own colors
eval `dircolors -b ~/.dir_colors`

# Don't wait for job termination notification
set -o notify

# Use case-insensitive filename globbing
shopt -s nocaseglob
# Make bash append rather than overwrite the history on disk
shopt -s histappend
# When changing directory small typos can be ignored by bash
shopt -s cdspell

###########################################################################
# Aliases
###########################################################################

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias svk='svk.bat'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Colors and unicode
alias g='grep --color=auto -rHn --exclude=\*.svn\*'                     # show differences in colour
alias screen='screen -U'

alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias lt='ls -ltr'
alias lsd='ls -lAd';
alias vi=vim

###########################################################################
# Functions
###########################################################################

function d
{
  date +%m%d%y_%H%M
}

###########################################################################
# Bash prompt
###########################################################################

Z="\[\033[0m\]"
BLK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GRN="\[\033[3;32m\]"
YEL="\[\033[0;33m\]"
BLU="\[\033[0;34m\]"
MGT="\[\033[0;35m\]"
CYN="\[\033[0;36m\]"
WHT="\[\033[0;36m\]"

JOBC="\[\033[36;44m\]"

function echopwd
{
  if [ "$TERM" = 'screen-bce' ]
  then
    CURRENTDIR=`pwd | sed 's/.*\/\([^/]*\)$/\1/'`
    if [ "`pwd`" = "${HOME}" ]; then
      CURRENTDIR="~"
    elif [ ${#CURRENTDIR} -gt 5 ]
    then
      CURRENTDIR=${CURRENTDIR:0:5}".."
    fi
    echo -ne "\033k$HOSTNAME@${CURRENTDIR}\033\\"
  fi
}

function promptcmd
{
  echopwd
  if [ `jobs | wc -l` -gt 0 ]; then
    export PS1="\n\n\u@\h: ${YEL}\w/$Z ${JOBC}\j$Z\n :;$Z "
  else
    export PS1="\n\n\u@\h: ${YEL}\w/$Z\n :;$Z "
  fi
  history -a
}

function precmd
{
  if [ "$TERM" = 'screen-bce' ]
  then
    echopwd
  fi
}

export PROMPT_COMMAND=promptcmd

trap precmd DEBUG
