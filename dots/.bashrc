# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI mode in bash
set -o vi

sourceIfExists(){
  local ALL=$@
  local IGNORED_FILES=".bash_profile .bash_history"
  for TARGET in ${ALL}
  do
    TARGET_BASENAME=$(basename ${TARGET})
    IS_IGNORED=$(echo ${IGNORED_FILES} | grep ${TARGET_BASENAME})
    if [ -z "${IS_IGNORED}" ]
    then
      [ -f ${TARGET} ] && source ${TARGET}
    fi
  done
}

# Import configurations
sourceIfExists ~/.bash_*
sourceIfExists ~/.git-*

# colors!
green="\e[32m"
blue="\[\033[1;34m\]"
purple="\[\033[1;35m\]"
reset="\[\033[0m\]"

 # Change command prompt
[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_STATESEPARATOR=" "
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWCOLORHINTS=1

PS1="${blue}[\w]$green\$(__git_ps1)$reset (╯°□°）╯︵ ┻━┻ \n> "

# Set default editor
export EDITOR=vim
