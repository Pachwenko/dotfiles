" Faster than silver searcher

" CONFIG FOR FZF
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" END CONFIG FOR FZF

" instead of ff use new :Files
" defined in zshrc
" :map <Space>ff :Files<CR>

" replace silver searcher
" map <Space>sp :Find
"


" remap grepprg to use ripgrep
set grepprg=rg\ --vimgrep

