#! /usr/bin/sh

# add rust cargo to path
if [ -d "$HOME/.cargo/bin" ] ; then
	PATH="$HOME/.cargo/bin:$PATH"
fi
source "$HOME/.cargo/env"

# add DOOM Emacs to path
PATH="$HOME/.emacs.d/bin:$PATH"

# use ripgrep instead of grep
alias grep='rg -i'
# ag is ues for silver searcher
alias ag='rg'

# The usual  `pyenv init` stuff
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# fix python install errors
export MACOSX_DEPLOYMENT_TARGET="11.2.2"
export CFLAGS=-"I/usr/local/include -L/usr/local/lib"
