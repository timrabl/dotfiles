# Genral exports
export EDITOR="vim"
export GPG_TTY=$(tty)
export LANG="en_US.UTF-8"
export UPDATE_ZSH_DAYS=2

# Path exports
export DOTFILES="$HOME/Git/repositories/private/dotfiles/ubuntu/"
export GOPATH="$HOME/Git/go"
export MANPATH="/usr/local/man:$MANPATH"
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:$GOPATH/bin"
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export ZSH="$HOME/.oh-my-zsh"

# ZSH internal vars
HIST_STAMPS="mm/dd/yyyy"
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=(
    "af-magic"
    "cloud"
)

plugins=(
	ansible
	colored-man-pages
	docker
	docker-compose
	fzf
    python
	golang
	gpg-agent
)

# Load OMZ
source $ZSH/oh-my-zsh.sh

# Lunch the GPG agent
gpgconf --launch gpg-agent

# Load NVM and NVM completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Listing
alias l.="ls -A | egrep "^\.""
alias l="ls -l"
alias la="ls -a"
alias ll="ls -laht" # The best one

# Git
alias g="git"
alias ga="git add $@"
alias gaa="git add ."
alias gbd="git branch -d $@"
alias gc="git commit"
alias gch="git checkout"
alias gchb="git checkout -b $@"
alias gcl="git clone $1"
alias gcm="git commit -m "$@""
alias gcp="git commit -p"
alias gd="git diff"
alias gp="git push"
alias gpl="git pull"
alias gpm="git push origin master"
alias gs="git status"

# Dotfiles
alias sz="source $HOME/.zshrc"
alias vv="vim $DOTFILES/.vimrc"
alias vz="vim $DOTFILES/.zshrc"

# Fix obvious typo's
alias cd..='cd ..'
alias pdw='pdw'

# readbale df output
alias df='df -H'

# function
pep8() {
    autopep8 --in-place --aggressive --aggressive $@
}

yaml2json() {
    python3 -c 'import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout, indent=4)'
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

update() {
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get dist-upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean
}
