# Look & feel
autoload -U compinit
compinit
setopt completeinword
zstyle ':completion:*' matcher-list 'm:{a-zA-z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
autoload select-word-style
select-word-style shell

# Aliases
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi
alias ll='ls -l'
alias la='ls -a'
alias 'a=sudo apt'
alias 'ai=sudo apt install'
alias 'ar=sudo apt remove'
alias 'au=sudo apt update'
alias 'ag=sudo apt safe-upgrade'
alias 'as=apt-cache search'
alias 'aw=apt-cache show'

function apt-list-packages {
  dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n' | grep -v deinstall | sort -n | awk '{print $1" " $2}'
}

# History
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

# globbing
setopt extendedglob
unsetopt caseglob

setopt interactivecomments
setopt auto_cd
PS1='[%T] %n%m:%~$ '
REPORTTIME=10


export TERM="xterm-256color"
setopt RM_STAR_WAIT
setopt interactivecomments
setopt CORRECT

export EDITOR="emacs"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

