alias utime='sudo /etc/network/if-up.d/ntpdate'
alias u='cd ..'
alias which="type -path"
alias x=startx

# google/data
alias startsffe=/google/data/ro/projects/static-on-bigtable/startsffe

# git
alias gap='git add -p'
alias gc='git commit'
alias gg='git gui'
alias gk='gitk --all'
alias gs='git status'

# git5
alias g5='git5'
alias ge='git5 export'
alias gsync='git5 sync'

alias loop="/google/src/head/depot/google3/video/youtube/testing/tools/build_and_test"

alias rss="ruby script/server"
alias rsc="ruby script/console"
alias rs="rails server --debugger"
alias rc="rails console --debugger"
alias erp="RAILS_ENV=production&&export RAILS_ENV"
alias erd="RAILS_ENV=development&&export RAILS_ENV"
alias t="tmux -u -2"
alias td="tmux -f ~/.vim/tmux/dashboard attach"
alias tt="tmux -f ~/.vim/tmux/turnimanager attach"
#Tails
alias ms='mailtrap start && tail -60f /var/tmp/mailtrap.output'
alias rdbt='tail -1000f /home/bernie/.vim/bundle/vim-ruby-debugger/tmp/ruby_debugger_output'

alias gvim='UBUNTU_MENUPROXY= gvim'

alias chrome='/opt/google/chrome/google-chrome %U'

# ssh aliases
alias turni="ssh app@turnimanager.com -p 30011 -X"

alias myps="ps -ef | grep $USER"
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate:reset db:seed && rake RAILS_ENV=test db:migrate:reset db:seed"
alias svnprecommit="git svn rebase && rake features && rake test"
alias hgprecommit="hg pull && rake features && rake test"
alias cuc="cucumber -r features"

alias g="git"
alias gf="git fetch"

alias hgdi="hg diff --color=always --git | less -r"
alias hgclean="hg status | grep -e '^\\?' | sed 's/^\\?//' | xargs -t rm -f"

alias rscreen="screen -c ~/.screen/rails"
alias wscreen="screen -c ~/.screen/wf"


alias b="bundle"
alias be="bundle exec"
alias bi="bundle install"
alias br="bundle exec rake"
alias zr="zeus rake"
alias zt="zeus rspec"
alias bir='rm Gemfile.lock && bundle install'

# alias ct="ctags-exuberant -R --exclude=.git --exclude=log * `gem env gemdir`/*"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
