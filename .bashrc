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
    xterm) color_prompt=yes;;
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
export GIT_PS1_SHOWCOLORHINTS=1
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)")\$ '
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
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

########### Bernie Customized

if [[ -e "${HOME}/.rbenv/bin/rbenv" ]]; then
	RBENV_ROOT=$HOME/.rbenv
elif [[ -e "/usr/local/rbenv/bin/rbenv" ]]; then
	RBENV_ROOT=/usr/local/rbenv
fi
 
export RBENV_ROOT
export PATH="${RBENV_ROOT}/bin:${PATH}"

if [[ -n "${RBENV_ROOT}" ]]; then
	eval "$($RBENV_ROOT/bin/rbenv init -)"
fi

if [[ -e "/opt/clion/bin" ]]; then
  export PATH="${PATH}:/opt/clion/bin"
fi

if [[ -e "/opt/webstorm/bin" ]]; then
  export PATH="${PATH}:/opt/webstorm/bin"
fi

if [[ -e "/opt/neo4j/bin" ]]; then
  export PATH="${PATH}:/opt/neo4j/bin"
fi

if [[ -e "/opt/pycharm/bin" ]]; then
  export PATH="${PATH}:/opt/pycharm/bin"
fi

if [[ -e "${HOME}/.pyenv/bin/pyenv" ]]; then
	PYENV_ROOT=$HOME/.pyenv
elif [[ -e "/usr/local/pyenv/bin/pyenv" ]]; then
	PYENV_ROOT=/usr/local/pyenv
else
        export PYTHONPATH=/usr/lib/python2.7/dist-packages:/usr/local/lib/python2.7/dist-packages
        if [[ -e "${HOME}/code/robotics" ]]; then
                export PYTHONPATH="${PYTHONPATH}:${HOME}/code/robotics"
        fi
fi
export PYENV_ROOT
export PATH="${PYENV_ROOT}/bin:${PATH}"

if [[ -n "${PYENV_ROOT}" ]]; then
	eval "$($PYENV_ROOT/bin/pyenv init -)"
fi

if [[ -e "/opt/webstorm/bin" ]]; then
  export PATH="${PATH}:/opt/webstorm/bin"
fi

if [[ -e "/opt/pycharm/bin" ]]; then
  export PATH="${PATH}:/opt/pycharm/bin"
fi

if [[ -e "/opt/datagrip/bin" ]]; then
  export PATH="${PATH}:/opt/datagrip/bin"
fi

if [[ -e "/opt/clion/bin" ]]; then
  export PATH="${PATH}:/opt/clion/bin"
fi

if [[ -e "$HOME/go_appengine" ]]; then
  export PATH="${PATH}:$HOME/go_appengine"
fi

export PATH=$PATH:$HOME/bin:./node_modules/.bin:$HOME/node_modules/.bin:$HOME/local/node/bin

export EDITOR=gvim

if [[ -f "$HOME/.nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
source $HOME/.vim/git-prompt/git-prompt.sh


# added by travis gem
[ -f /usr/local/google/home/btelles/.travis/travis.sh ] && source /usr/local/google/home/btelles/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [[ -f "$HOME/google-cloud-sdk/path.bash.inc" ]]; then
  source "$HOME/google-cloud-sdk/path.bash.inc"
fi

# The next line enables shell command completion for gcloud.
if [[ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]]; then
  source "$HOME/google-cloud-sdk/completion.bash.inc"
fi

if [[ -e "/opt/neo4j/bin" ]]; then
  export PATH=$PATH:/opt/neo4j/bin
fi

if [[ -e "/opt/java/bin" ]]; then
  export PATH=$PATH:/opt/java/bin
fi


# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[ -f /usr/local/google/home/btelles/.nvm/versions/node/v6.2.0/lib/node_modules/yo/node_modules/tabtab/.completions/yo.bash ] && . /usr/local/google/home/btelles/.nvm/versions/node/v6.2.0/lib/node_modules/yo/node_modules/tabtab/.completions/yo.bash

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -e /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/code/
fi
