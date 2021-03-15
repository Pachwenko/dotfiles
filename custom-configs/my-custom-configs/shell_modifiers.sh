#! /usr/bin/sh

# add rust cargo to path
if [ -d "$HOME/.cargo/bin" ] ; then
	PATH="$HOME/.cargo/bin:$PATH"
fi
source "$HOME/.cargo/env"

# add DOOM Emacs to path
PATH="$HOME/.emacs.d/bin:$PATH"

EDITOR="nvim"
VISUAL="$EDITOR"
GIT_EDITOR="$EDITOR"

# use ripgrep instead of grep (way faster) - install with brew install ripgrep
alias grep='rg -i'
# ag is used for silver searcher, also use ripgrep instead
alias ag='rg'

# The usual  `pyenv init` stuff
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# fix python install errors
# export MACOSX_DEPLOYMENT_TARGET="11.2.2" # not sure why this happens but it can become "11.2."...
export CFLAGS=-"I/usr/local/include -L/usr/local/lib"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
