#!/bin/zsh
# vim: set foldmarker=<<,>> foldlevel=0 foldmethod=marker:

# General Settings <<1
# Add Heroku Toolbelt to the path on osx <<2
#-------------------------------------------------------------------------------
if [ "$(uname)" = "Darwin" ]; then
    PATH="/usr/local/heroku/bin:$PATH"
fi
# >>2
# Add Postgres to the path <<2
#-------------------------------------------------------------------------------
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
# >>2
# Export JAVA_CMD if jdk is installed (used by lein for compiling local java classes)<<2
#--------------------------------------------------------------------
# if [[ -s "/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home/bin/java" ]]; then
#     export JAVA_CMD="/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home/bin/java"
# fi
# So we can Haskell <<2
#-------------------------------------------------------------------------------
if [ "$(uname)" = "Darwin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
# >>2
# Eliminate lag between transition from normal/insert mode <<2
#-------------------------------------------------------------------------------
# If this causes issue with other shell commands it can be raised default is 4
export KEYTIMEOUT=1
# >>2
# >>1

# Aliases <<1
#-------------------------------------------------------------------------------
if [ "$(uname)" = "Darwin" ]; then
    alias update='brew update && brew upgrade'
    alias upgrade='brew upgrade'
    alias clean='brew doctor'
else
    alias update='sudo apt-get update && sudo apt-get upgrade'
    alias upgrade='sudo apt-get upgrade'
    alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
    alias root_trash='sudo bash -c "exec rm -r /root/.local/share/Trash/{files,info}/*"'
fi

alias drun='python manage.py runserver'
alias dtest='python manage.py test'
alias entr_example='print ls *.py | entr -s \"python manage.py test\"'
alias tmuxtmux='print exit tmux inside a tmux ssh session is (ctrl space b) colon, type detach then hit tab. enter to exit!'
alias pman='python manage.py'
alias runv='workon vector && python ~/Projects/vector/src/manage.py remote_staging runserver'
alias testv='workon vector && python ~/Projects/vector/src/manage.py test test'
alias squashall='print Checkout the branch you want to squash all commits, then do \"git reset --soft master\", then commit the changes you want to make. Once commited do \"git push --force\"'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'
alias fixcrypto='pip uninstall pycrypto pycryptodome --yes; pip install pycrypto==2.6.1'
alias clear='clear && ls'
alias example_test='python manage.py test test rating.tests.views.test_premiums_view.PremiumsViewDetailsTests.method'
alias wit='python ~/Projects/webinquiry_dj/manage.py test test webinquiry.tests.change_request_pdf_tests.ChangeRequestPdfInfoTests'
alias runw='workon webinquiry_dj && python ~/Projects/webinquiry_dj/manage.py remote_staging runserver'
alias delpyc='find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete'

alias cdd='builtin cd $1 && ls -F'

alias maintenence='brew update && brew upgrade && brew cleanup -s && npm update -g && printf "TODO: check for new version of dotfiles or other items missed\n" && printf "Also, open nvim and do PlugUpdate, PlugUpgrade, PlugClean."'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias ts='tig status'
alias ll='ls -lh'
alias la='ls -la'
alias less='less -imJMW'
alias ping='ping -c 5'      # Pings with 5 packets, not unlimited
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias clone='git clone'
alias push='git publish'
alias pull='git pull-rebase'
alias publish='git publish'
alias pr='hub pull-request'
alias gcb='git checkout -b'
alias mm='git fetch && git merge origin/master'
alias gcm='git checkout master'
alias amend='git commit --amend'
alias gr1='greset 1'
alias grh='git reseth'
alias ts='tig status'
alias delete_pyc='find . -name \*.pyc -exec rm \{\} \+'
alias c='clear'
alias vom='vim'
alias vi='vim'
alias cljs='planck'
alias m='python manage.py'
alias mr='python manage.py remote_staging runserver'
alias mt='python manage.py test test'
alias srcm='python src/manage.py'
alias srcmr='python src/manage.py remote_staging runserver'
alias srcmt='python src/manage.py test test'

alias p3m='python3 manage.py'
alias p3='python3'
alias uppip='pip install --upgrade pip'
alias tree="tree -I '*.pyc|__pycache__'"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder"
alias killhidden="defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder"
alias pyclean="find . -name '*.pyc' -delete"
alias showstash="git stash list | awk -F: '{ print \"\n\n\n\n\"; print $0; print \"\n\n\"; system(\"git stash show -p \" $1); }'"
alias git-track='function _gittrack(){ git branch --set-upstream-to=origin/"$1" "$1";};_gittrack'
alias which-tmux='tmux display-message -p "#S"'
alias mkvenv27='mkvirtualenv  -p/Users/imtapps/.pyenv/versions/2.7.12/bin/python'
alias myip="curl http://ipecho.net/plain; echo"
alias prod-db="./manage.py tunnel dbtunnel --environment=Production --application=$1 --port=1234"
alias iyapf="yapf . --parallel --recursive -i -p --exclude='./dist/*' --exclude='./.tox/*' --exclude='./*.egg-info' --style='{based_on_style: facebook, COLUMN_LIMIT: 120, BLANK_LINE_BEFORE_NESTED_CLASS_OR_DEF: true, ALLOW_SPLIT_BEFORE_DICT_VALUE: false}'"
alias etest='ember t -s'
alias et='ember t -s'
alias eft='ember exam --split=2 --parallel --silent'
alias es='ember serve'

alias mkvenv3="pyenv virtualenv 3.4.10"
alias rmvenv="pyenv deactivate && pyenv uninstall"
alias deactivate="pyenv deactivate"
# >>1

# Functions <<1
#===============================================================================
# Python webserver <<2
#-------------------------------------------------------------------------------
#  cd into a directory you want to share and then
#  type webshare. You will be able to connect to that directory
#  with other machines on the local net work with IP:8000
#  the function will display the current machines ip address
#-------------------------------------------------------------------------------
function pyserve() {
    if [ "$(uname)" = "Darwin" ]; then
        local_ip=`ifconfig | grep 192 | cut -d ' ' -f 2`
    else
        local_ip=`hostname -I | cut -d " " -f 1`
    fi
    echo "connect to $local_ip:8000"
        python -m SimpleHTTPServer > /dev/null 2>&1
    }
# >>2
# Work Timer <<2
#-------------------------------------------------------------------------------
# A timer function that will say the message after the specified amount of time.
#-------------------------------------------------------------------------------
function workTimer() {
    echo -n "How long to set timer for? (ex. 1h, 10m, 20s, etc) => "; read duration
    echo -n "What to say when time finishes => "; read finishMessage
    if [ "$(uname)" = "Darwin" ]; then
      if [ $duration[-1] = "h" ]; then
          (( durationInHours = $duration[1,-2] * 60 * 60))
          sleep $durationInHours && say "$finishMessage"
      elif [ $duration[-1] = "m" ]; then
          (( durationInMinutes = $duration[1,-2] * 60))
          sleep $durationInMinutes && say "$finishMessage"
      elif [ $duration[-1] = "s" ]; then
          sleep $duration && say "$finishMessage"
      else
        echo "You must specify; Hours, Min or Seconds.."
      fi
    else
      sleep $duration && espeak "$finishMessage" && zenity --info --title="$name" --text="$finishMessage"
    fi
}
# >>2
#
#
#
# Git reset <<2
function greset() { git reset HEAD~"$1"}
# >>2

# Make dirs recursively <<2
#
#
function mkc () {
    mkdir -p $1
    cd $1
}
# >>2
# Memory Usage <<2
#-------------------------------------------------------------------------------
# Shows the specified number of the top memory consuming processes and their PID
#-------------------------------------------------------------------------------
function mem_usage() {
    echo -n "How many you what to see? "; read number
    echo ""
    echo "Mem Size       PID     Process"
    echo "============================================================================="
    if [ "$(uname)" = "Darwin" ]; then
      ps aux | awk '{ output = sprintf("%5d Mb --> %5s --> %s%s%s%s", $6/1024, $2, $11, $12, $13, $14); print output }' | sort -gr | head -n $number
    else
      ps aux | awk '{ output = sprintf("%5d Mb --> %5s --> %s%s%s%s", $6/1024, $2, $11, $12, $13, $14); print output }' | sort -gr | head --line $number
    fi
    }
# >>2
# Spell Check <<2
#------------------------------------------------------------------------------
# Because, well I need to spell check a lot :\
#------------------------------------------------------------------------------
spell (){
    echo $1 | aspell -a
}
# >>2
# Search for running processes <<2
# -------------------------------------------------------------------
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        if [ "$(uname)" = "Darwin" ]; then
            echo "USER            PID     %CPU %MEM VSZ       RSS  TTY   STAT START     TIME    COMMAND"
        else
            echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND"
        fi
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}
# >>2
# Display a neatly formatted path <<2
# -------------------------------------------------------------------
path() {
echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
  }
# >>2
# Displays mounted drive information in a nicely formatted manner <<2
# -------------------------------------------------------------------
function nicemount() {
    (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ;
}
# >>2
# Source file if it exists <<2
#--------------------------------------------------------------------
include() {
    [[ -s "$1" ]] && source "$1"
}
# >>2
# agvim open ag results in vim <<2
#--------------------------------------------------------------------
agv() {
   vim +"Search"
}
# >>2
# Extract the most common compression types <<2
#--------------------------------------------------------------------
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
# >>2
# Find a file with a pattern in name: <<2
#--------------------------------------------------------------------
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }
# >>2
# Create an archive (*.tar.gz) from given directory <<2
#--------------------------------------------------------------------
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
# >>2
# Create a ZIP archive of a file or folder <<2
#--------------------------------------------------------------------
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
# >>2
# Get info about an ip or url <<2
#--------------------------------------------------------------------
# Usage:
# ipinfo -i 199.59.150.7
# ipinfo -u github.com
#--------------------------------------------------------------------
ipinfo() {
    if [ $# -lt 2 ]; then
      echo "Usage: `basename $0` -i ipaddress" 1>&2
      echo "Usage: `basename $0` -u url" 1>&2
      return
    fi
    if [ "$1" = "-i" ]; then
        desiredIP=$2
    fi
    if [ "$1" = "-u" ]; then
        # Aleternate ways to get desired IP
        # desitedIP=$(host unix.stackexchange.com | awk '/has address/ { print $4 ; exit }')
        # desiredIP=$(nslookup google.com | awk '/^Address: / { print $2 ; exit }')
        desiredIP=$(dig +short $2)
    fi
    curl freegeoip.net/json/$desiredIP | python -mjson.tool
}
# >>2
# Upwards directory traversal shortcut <<2
#--------------------------------------------------------------------
# Hitting `...` will produce `../..` an additional `/..` will be added
# for every `.` after that
# -------------------------------------------------------------------
traverse_up() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N traverse_up
bindkey . traverse_up
# >>2
# Expand aliase to real command <<2
get_alias() {
  printf '%s\n' $aliases[$1]
}
# >>2
# >>1
