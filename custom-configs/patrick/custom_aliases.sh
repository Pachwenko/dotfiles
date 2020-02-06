#!/bin/zsh

alias stash='git stash'
alias pop='git stash pop'
alias status='git status'
alias checkout='git checkout'
alias co='git checkout'
alias s='git status'
alias t='tig status'
alias ti='tig'
alias pipi='pip install'
alias pipir='pip install -r requirements/dev.txt'
alias pipup='pip install --upgrade pip'
alias pipu='pip uninstall'
alias pipclean=' pip freeze > temp.txt && pip uninstall -r temp.txt -y'
alias activate='pyenv activate'
alias a='pyenv activate'
alias d='pyenv deactivate'
alias mkenv36='deactivate; pyenv virtualenv 3.6.8 $(basename $PWD); pyenv activate $(basename $PWD); pipup'
alias mkenv3='deactivate; pyenv virtualenv 3.4.10 $(basename $PWD); pyenv activate $(basename $PWD); pipup'
alias mkenv2='deactivate; pyenv virtualenv 2.7.14 $(basename $PWD); pyenv activate $(basename $PWD); pipup'
alias denv='pyenv virtualenv-delete $(basename $PWD)'
alias pinit='deactivate; pyenv virtualenv 3.4.10 $(basename $PWD); pyenv activate $(basename $PWD); pip install --upgrade pip && pip install -r requirements/dev.txt'
alias v='vim'
alias vi='vim'
alias pul='pull'
alias fetch='git fetch'
alias update='brew update && brew upgrade && brew cask upgrade'
alias deployvector='bundle exec cap staging deploy'

alias nukedocker='docker system prune -a --volumes'
alias emberperms='ember g ember-cli-deploy-permissions'
alias essl='ember s --ssl --ssl-key ~/.tls/localhost.imtapps.com.key --ssl-cert ~/.tls/localhost.imtapps.com.crt --port 4200'
alias gmm='git fetch && git rebase origin/master'
alias aias='vim ~/dotfiles/custom-configs/patrick/custom_aliases.sh'
alias openconfigs='vim ~/dotfiles/custom-configs/patrick/'

alias phonehome='ssh pachwenko@10.20.20.198 -p 39666'

cpinit() {
 hub clone imtapps/$1
 cd $1
 deactivate; pyenv virtualenv 3.4.10 $(basename $PWD); pyenv activate $(basename $PWD); pip install --upgrade pip && pip install -r requirements/dev.txt
}

ceinit() {
    hub clone imtapps/$1
    cd $1
    npm install
    ember g ember-cli-deploy-permissions
}
