alias utime='sudo /etc/network/if-up.d/ntpdate'
alias u='cd ..'
alias which="type -path"
alias x=startx
alias gg='git gui'
alias gk='gitk --all'
alias gs='git status'
alias rss="ruby script/server"
alias rsc="ruby script/console"
alias erp="RAILS_ENV=production&&export RAILS_ENV"
alias erd="RAILS_ENV=devolpment&&export RAILS_ENV"
alias myf="ssh webmgr@myflorida.com"
alias ms='mailtrap start && tail -60f /var/tmp/mailtrap.output'

# ssh aliases
alias 115z3="ssh webmgr@sun115z3.dms.state.fl.us"
alias m115z3="sshfs webmgr@sun115z3.dms.state.fl.us:/ /home/aaaa/DMS/sun115z3"
alias 113z1="ssh webmgr@sun113z1.dms.state.fl.us"
alias m113z1="sshfs webmgr@sun113z1.dms.state.fl.us:/ /home/aaaa/DMS/sun113z1"
alias turni="ssh app@turnimanager.com -p 30011 -X"

alias myps="ps -ef | grep $USER"
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias gadd="git add -u && git add . && git status"
alias svnprecommit="git svn rebase && rake features && rake test"
alias hgprecommit="hg pull && rake features && rake test"
alias cuc="cucumber -r features"
alias g="git"
alias tu="ruby_test unit"
alias tf="ruby_test functional"
alias su="ruby_tu_rs unit"
alias sf="ruby_tu_rs functional"
alias ti="ruby_test integration"
alias hgdi="hg diff --color=always --git | less -r"
alias hgclean="hg status | grep -e '^\\?' | sed 's/^\\?//' | xargs -t rm -f"
alias gi="sudo gem install"
alias giv="sudo gem install -v"
alias gci="git pull --rebase && rake && git push"
alias rscreen="screen -c ~/.screen/rails"
alias deploy_staging="git push origin master && cap staging deploy"
alias deploy_production="git push origin master && cap production deploy"

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