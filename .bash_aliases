alias utime='sudo /etc/network/if-up.d/ntpdate'
alias u='cd ..'
alias which="type -path"
alias x=startx
alias gg='git gui'
alias gk='gitk --all'
alias gs='git status'
alias gc='git commit'
alias gap='git add -p'
alias r='rails'
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
alias gadd="git add -u && git add . && git status"
alias gi="sudo gem install"
alias giv="sudo gem install -v"
alias gci="git pull --rebase && rake && git push"

alias hgdi="hg diff --color=always --git | less -r"
alias hgclean="hg status | grep -e '^\\?' | sed 's/^\\?//' | xargs -t rm -f"

alias rscreen="screen -c ~/.screen/rails"
alias wscreen="screen -c ~/.screen/wf"


alias b="bundle"
alias be="bundle exec"
alias bi="bundle install"
alias br="bundle exec rake"
alias bir='rm Gemfile.lock && bundle install'


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
