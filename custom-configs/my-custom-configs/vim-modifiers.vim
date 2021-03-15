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

" pretty print
command Jsontool :%! python -m json.tool %
command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %
command! RemoveEmptyLines :g/^\s*$/d
" More vertical and Horizon split commands
" Vertical split is :sp and Horizontal split is :vs
command Vs :vs
command Hs :sp
command VS :vs
command HS :sp

command! FormatPython 0,$!black -l 120

autocmd FileType python nnoremap <leader>y :0,$!yapf --style="{based_on_style: facebook, FORCE_MULTILINE_DICT: true, SPLIT_ALL_COMMA_SEPARATED_VALUES: true, COLUMN_LIMIT: 120, BLANK_LINE_BEFORE_NESTED_CLASS_OR_DEF: true}"<Cr><C-o>

