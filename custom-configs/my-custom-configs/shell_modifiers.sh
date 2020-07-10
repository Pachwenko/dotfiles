#! /usr/bin/sh

if [ -d "$HOME/.cargo/bin" ] ; then
	PATH="$HOME/.cargo/bin:$PATH"
fi

# use ripgrep instead of grep
alias grep='rg'
# ag is ues for silver searcher
alias ag='rg'
