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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

#--------------------------------------------------
# burası bana özel

#cd den sonra ls
function cd () {
    dir=""
    if [ "$1" =  b ] 
    then
        dir="$BACK"
    else
        dir="$1"
    fi
    BACK=`pwd`
    command cd "$dir"; ls --color;
    
}

#touchpadin etkinliği için switch
function touchpad(){
    data=`synclient|grep TouchpadOff`
    arr=(${data//=/ })
    val=${arr[1]}
    command synclient TouchpadOff=$((`expr $val + 1`%2))
}

#git flow brachlar arası hızlı geçiş
function co () {
branch=`git branch | grep $1`
if [ "${branch:0:1}" = "*" ]
then
 echo "already on ${branch:1}"
else
 command git checkout $branch;
fi
}

#explains given shell command
function explain {
  # base url with first command already injected
  # $ explain tar
  #   => http://explainshel.com/explain/tar?args=
  url="http://explainshell.com/explain/$1?args="

  # removes $1 (tar) from arguments ($@)
  shift;

  # iterates over remaining args and adds builds the rest of the url
  for i in "$@"; do
    url=$url"$i""+"
  done

  # opens url in browser
  xdg-open $url
}

#ls kısaltması
alias ls="ls --color"

#bilgisayarı kapamak için
alias kapa="sudo shutdown -h now"

#bilgisayarı yeniden başlatmak için için
alias reboot="sudo shutdown -r now"

#update repo
alias update="sudo apt-get update"

#get from repo
alias get="sudo apt-get install"

#look for cpu heat
alias isi="watch -n 1 -d sensors"

#karakter tanımlaması için
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

touchpad;
#scripti arka tarafta calistirir 
nohup sh /home/kubudi/codebase/scripts/inotifyrun 2> /dev/null 1> /dev/null &

#---------------------------------------------------
#path tanımlamaları

#tmux
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

#custom scripts
export PATH=$PATH:/home/kubudi/codebase/scripts
#cd ye gereken  back değişkeni
export BACK=`pwd`

#Spotify icin
LC_NUMERIC=en_US.utf8

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#for tech talk app
export SMTP_USER="techtalk@iletken.com.tr"
export SMTP_PASS="techtalk1234"
export DB_URL="jdbc:mysql://localhost/techTalk?characterEncoding=UTF-8"
export DB_USER="root"
export DB_PASS="root"
export APP_URL="http://localhost:9000/"


#for ares
export ARES_SMTP_USER="no-reply@iletken.com.tr"
export ARES_SMTP_PASS="noreplymailsifresi"
export ARES_DB_URL="jdbc:mysql://localhost/ares?characterEncoding=UTF-8"
export ARES_DB_USER="root"
export ARES_DB_PASS="root"
export ARES_APP_URL="http://localhost:9000/"


