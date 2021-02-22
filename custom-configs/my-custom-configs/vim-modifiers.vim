vnoremap <mm> <C-R>cprint()<ESC>p<CR>
let g:python3_host_prog = expand('/Users/patrickmccartney/.pyenv/versions/python3/bin/python')
let g:python_host_prog = expand('/Users/patrickmccartney/.pyenv/versions/python2/bin/python')

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
