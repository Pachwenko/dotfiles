
"===============================================================================
" Plugin source
"===============================================================================

"===============================================================================
" Plugin Configurations
"===============================================================================
"

" colorscheme spacecamp

" Palenight colorscheme
set background=dark
colorscheme palenight
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


""For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
""Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"if (has("termguicolors"))
"  set termguicolors
"endif
"let g:palenight_terminal_italics=1


" One colorscheme
" colorscheme one
" set background=dark " for the dark version
" set background=light " for the light version


" OceanicNext Theme
" syntax enable

" for vim 8
"  if (has("termguicolors"))
"   set termguicolors
"  endif

" colorscheme OceanicNext


" Nord colorscheme
" colorscheme nord


" Gruvbox Colorscheme ** A nice one
" colorscheme gruvbox


" Ayu Colorscheme
" set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

"===============================================================================
" Plugin Keymappings
"===============================================================================
" N/A

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
" N/A
