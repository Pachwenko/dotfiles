vnoremap <mm> <C-R>cprint()<ESC>p<CR>
let g:python3_host_prog = expand('/Users/patrickmccartney/.pyenv/versions/python3/bin/python')
let g:python_host_prog = expand('/Users/patrickmccartney/.pyenv/versions/python2/bin/python')

autocmd FileType python nnoremap <leader>y :0,$!yapf --style="{based_on_style: facebook, COLUMN_LIMIT: 120, BLANK_LINE_BEFORE_NESTED_CLASS_OR_DEF: true}"<Cr><C-o>

"Turn on backup option
set backup

"Where to store backups
set backupdir=~/.backups/vim//

"Make backup before overwriting the current buffer
set writebackup

"Overwrite the original backup file
set backupcopy=yes

"Meaningful backup name
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M:%S")
