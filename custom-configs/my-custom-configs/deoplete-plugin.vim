"===============================================================================
" Plugin source
"===============================================================================
"'Shougo/deoplete.nvim'

"===============================================================================
" Plugin Configurations
"===============================================================================
" disable neocomplete
" let g:neocomplete#enable_at_startup = 0
" use deoplete instead (same author)
let g:deoplete#enable_at_startup = 1
let g:jedi#auto_vim_configuration = 0
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

"===============================================================================
" Plugin Keymappings
"===============================================================================
" N/A

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
" N/A
