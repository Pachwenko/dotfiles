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

if [[ "$(uname -s)"  == "Darwin" ]] ; then

  # Adopted SDK workaround from @marcosgomesborges
  [[ -n "$MACOSX_DEPLOYMENT_TARGET"  ]]  || export MACOSX_DEPLOYMENT_TARGET="$(sw_vers -productVersion | cut -c -5)"    # e.g.: 10.14
  [[ -n "$SDKROOT" ]]                    || export SDKROOT="$(xcrun --show-sdk-path)"

  # Workaround for OpenSSL header/library paths (for GCC & LINKER)
  pfx_openssl="$(brew --prefix openssl)"  # Change this if openssl was not installed via homebrew
  if [[ -d "$pfx_openssl" ]]  ; then
      export CPATH="${pfx_openssl}/include:${CPATH}"                # Headers for C pre-processor
      export LIBRARY_PATH="${pfx_openssl}/lib:${LIBRARY_PATH}"      # libraries (for the linker)
  fi

fi
