# SECTION: ZSH
export ZSH="/home/rabl/.oh-my-zsh"
export UPDATE_ZSH_DAYS=2

ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
	git
	ansible
	archlinux
	colored-man-pages
	cp
	docker
	docker-compose
	fzf
	golang
	gpg-agent
	nmap
	npm
	npx
	nvm
	pep8
	pip
	pipenv
	postgres
	pylint
	python
	rsync
	sudo
	tmux
	vscode
)

source $ZSH/oh-my-zsh.sh
# END SECTION: ZSH


# SECTION PATH
export DOTFILES="$HOME/Git/repositories/private/dotfiles/manjaro/"
export GOPATH="$HOME/go"
export MANPATH="/usr/local/man:$MANPATH"
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:$GOPATH/bin"
# END SECTION PATH

# SECTION LANGUAGE
export LANG="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
# END SECTION LANGUAGE


# SECTION: EDITOR
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
# END SECTION: EDITOR

# SECTION: COMPILER
export ARCHFLAGS="-arch x86_64"
# END SECTION: COMPILER


# SECTION: GPG
unset SSH_AGENT_PID

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye >/dev/null
# END SECTION: GPG

# SECTION DOCKER
export DOCKER_BUILDKIT=1
#export DOCKER_HOST="ssh://$USER@docker-$USER.mgmt.komro.net"
# END SECTION DOCKER

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

# pacman alias
alias pp='sudo pacman -Rns $(pacman -Qtdq)'

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

