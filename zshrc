# Path to your oh-my-zsh configuration.
ZSH=/Users/m.goezaydin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

alias zshrc="vi ~/.zshrc"
alias szshrc="source ~/.zshrc"
alias bashrc="vi ~/.bashrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias dsa=dockerstopall
alias onelogin="/Users/m.goezaydin/bin/onelogin-darwin"
alias kubectl-log-qa="kubectl --kubeconfig=$HOME/.kube_tool/qa"
alias kubqa="kubectl-log-qa"
alias kubectl-log-stg="kubectl --kubeconfig=$HOME/.kube_tool/staging"
alias kubst="kubectl-log-stg"
alias kubectl-log-prd-us="kubectl --kubeconfig=$HOME/.kube_tool/production-us"
alias kubus="kubectl-log-prd-us"
alias kubectl-log-prd-eu="kubectl --kubeconfig=$HOME/.kube_tool/production-eu"
alias kubeu="kubectl-log-prd-eu"
alias kubectl-log-prd-ap="kubectl --kubeconfig=$HOME/.kube_tool/production-ap"
alias kubap="kubectl-log-prd-ap"
alias kublt="kubectl --kubeconfig=$HOME/.kube_tool/load-tests"
alias image=describepodandgetimage
alias runscript="./tools/kube_tool deploy chart -p load-tests -e load-tests -v 1.4.2 -r eu-west-1 -c routing"

export ONELOGIN_USERNAME=mehmet.goezaydin@deliveryhero.com
export GITHUB_TOKEN=2ee3a5ad58f9636690f65b70027320861ba28e86


function dockerstopall {
  for f in `docker ps -a -q`; 
  do 
   docker stop $f
  done
}

function describepodandgetimage {
 kublt describe pod $1 | grep "Image:"
}

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git gitfast textmate ruby lighthouse)
plugins=(git autojump last-working-dir sublime )
source $ZSH/oh-my-zsh.sh

#cd den sonra ls(pretty badass) 
function chpwd() {
  ls 
}

#bilgisayarı kapamak için
alias kapa="sudo shutdown -h now"

#bilgisayarı yeniden başlatmak için için
alias reboot="sudo shutdown -r now"

#karakter tanımlaması için
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_NUMERIC=en_US.utf8

#for thefuck
alias fuck='$(thefuck $(fc -ln -1))'
# You can use whatever you want as an alias, like for mondays:
alias fix='fuck'

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/m.goezaydin/.zshrc'


zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"


autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
