OS="$(~/.bin/getos.sh)"

# Git Aliases
alias gb='git branch'
alias gs='clear && git status 2> /dev/null'
alias ga='git add'
alias gall='git add -A && gs'
alias gau='git add -u'
alias gl='git log'
alias gk='gitk'
alias gf='git fetch -v'
alias co='git checkout'
alias gd='clear && git diff'
alias gds='clear && git diff --staged'
alias gp='git fetch && git pull'
alias gdt='git difftool'
alias gdm='git diff remotes/origin/master..'
alias gmt='git mergetool'
alias grl='git reflog'
alias gst='git stash'
alias gcm='git commit'
alias grs='git reset'
alias gcl='git clone'
alias grb='git rebase'
alias grf='git show-ref'
alias gma='git merge --abort'
alias grbm='git rebase master'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gcma='git commit --amend'
alias gcman='git commit --amend --no-edit --no-verify'
alias gdms='git diff --stat --color master..'
alias gclean='git clean -df'
alias lsgst='git stash list'
alias uptrefs='git fetch origin --prune'
alias gr='git remote'
alias gpsm='git push origin master'

# Edit
alias editbutils="nvim ${HOME}/.bash_utils"
alias editvimconfig='nvim ${HOME}/.config/nvim/init.vim'
alias editbaliases='nvim ${HOME}/.bash_aliases'
alias editbash='nvim ${HOME}/.bashrc'

# Other Aliases
alias xx='exit'
alias bgdisown='bg && disown'
alias poweroff='shutdown -P now'
alias lsgem='gem list'
alias rst='reset'
alias susu='sudo su'
alias nvmv='nvm current'
alias nvmd='nvm alias default '
alias srbash='source ${HOME}/.bashrc'
alias gfup='git fetch upstream'
alias del='rm -rf'
alias lsnvm='nvm list'
alias lspip='pip3 list'
alias clr='clear && '
alias cpp='rsync -aP '

# npm
alias npmprune='npm prune && npm i && npm i'
alias rstnpm='clear && rm -rf ./node_modules && npm i && npm i'
alias lsnpm='npm ls --depth 0'
alias rnpm='npm remove'

# cds
alias ..='cd ..'
alias cdssh='cd ${HOME}/.ssh && ls'
alias cdvagrant='cd /vagrant/'

# Docker
alias dk='docker'
alias dkc='docker-compose'
alias dki='docker images'
alias dkps='docker ps'
alias dkrit='docker run -it'
alias dkinfo='clear && dki && echo -e "\n\n#######################\n\n" && dkps -a'

# Elm
alias celm="./node_modules/.bin/elm"
alias celm-make="./node_modules/.bin/elm-make"
alias celm-package="./node_modules/.bin/elm-package"
alias celm-reactor="./node_modules/.bin/elm-reactor"
alias celm-repl="./node_modules/.bin/elm-repl"

# HAM
alias conto='gall && gcman && gps -f --no-verify'

# Tmux
alias tm='tmux'
alias tma='tmux attach'
alias lstmux='tmux ls'

# Use color on `ls` across linux and mac
case "${OS}" in
  linux)
    LS_OPTIONS="--color=auto"
    ;;
  mac)
    LS_OPTIONS="-G"
    ;;
esac

# ls aliases
alias l='ls -CF ${LS_OPTIONS}'
alias ls='ls -CF ${LS_OPTIONS}'
alias la='ls -A ${LS_OPTIONS}'
alias ll='ls -lF ${LS_OPTIONS}'
alias lla='ls -lFa ${LS_OPTIONS}'

alias less='less -R'

# Random
alias doge-quotes='while true; do doge | lolcat -a -d 100 -s 100 -p 1; done'

