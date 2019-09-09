#!/bin/zsh

alias stash='git stash'
alias pop='git stash pop'
alias status='git status'
alias checkout='git checkout'
alias s='git status'
alias t='tig status'
alias pipi='pip install'
alias pipir='pip install -r requirements/base.txt'
alias pipup='pip install --upgrade pip'
alias activate='pyenv activate'
alias a='activate'
alias d='deactivate'
alias mkenv3='deactivate; pyenv virtualenv 3.4.10 $(basename $PWD); pyenv activate $(basename $PWD)'
alias mkenv2='deactivate; pyenv virtualenv 2.7.14 $(basename $PWD); pyenv activate $(basename $PWD)'
alias denv='pyenv virtualenv-delete $(basename $PWD)'
alias pinit='mkenv3 && pipir'
