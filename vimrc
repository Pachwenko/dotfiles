" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:

"===================================================================================
"  DESCRIPTION:  ”Life is frittered away by detail... simplify, simplify.” – Thoreau
"       AUTHOR:  Jarrod Taylor
" ____   ____.__                  .__               __
" \   \ /   /|__| _____           |__| ____ _____ _/  |_  ___________
"  \   Y   / |  |/     \   ______ |  |/    \\__  \\   __\/  _ \_  __ \
"   \     /  |  |  Y Y  \ /_____/ |  |   |  \/ __ \|  | (  <_> )  | \/
"    \___/   |__|__|_|  /         |__|___|  (____  /__|  \____/|__|
"                     \/                  \/     \/
"
"===================================================================================

" Source custom-init to allow excluding plugins {1
let b:customInit=expand('~/dotfiles/custom-configs/**/custom-init.vim')
if filereadable(b:customInit)
    exe 'source' b:customInit
endif

if !exists("g:exclude")
    let g:exclude = [""]
endif
" }1

" Buffer variables that control plugin loading {1
let b:pluginList = split(globpath('~/.vim/order-dependent-unite-config', '*.vim'), '\n')
let b:pluginList += split(globpath('~/.vim/plugin-configs', '*.vim'), '\n')
let b:pluginList += split(globpath('~/dotfiles/custom-configs/**', '*-plugin.vim'), '\n')
let b:fileList = split(globpath('~/.vim/order-dependent-unite-config', '*.vim'), '\n')
let b:fileList += split(globpath('~/.vim/vanilla-configs', '*.vim'), '\n')
let b:fileList += split(globpath('~/.vim/plugin-configs', '*.vim'), '\n')
let b:fileList += split(globpath('~/.vim/functions', '*.vim'), '\n')
let b:fileList += split(globpath('~/dotfiles/custom-configs/**', '*.vim'), '\n')
"}1

" Set leader keys {1
let mapleader=" "
let maplocalleader= '|'
"}1

" Function to process lists for sourceing and adding bundles {1
function! ProcessList(listToProcess, functionToCall)
    for fpath in a:listToProcess
        if index(g:exclude, split(fpath, "/")[-1]) >= 0
            continue
        else
            call {a:functionToCall}(fpath)
        endif
    endfor
endfunction

function! AddBundle(fpath)
    execute "Plug " . readfile(a:fpath, "", 4)[-1][1:]
endfunction

function! SourceFile(fpath)
    exe 'source' a:fpath
endfunction
"}1

" Manage plug-ins {1
if &compatible
    set nocompatible
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
call ProcessList(b:pluginList, 'AddBundle')
Plug '~/dotfiles/vim/my-plugins/vim-grep-quickfix'
Plug '~/dotfiles/vim/my-plugins/vim-wiki-links'
call plug#end()

filetype plugin indent on
" }1

" Source Vim configurations {1
call ProcessList(b:fileList, "SourceFile")
" }1


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
