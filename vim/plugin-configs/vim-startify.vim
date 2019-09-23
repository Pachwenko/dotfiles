"===============================================================================
" Plugin source
"===============================================================================
"'mhinz/vim-startify'

"===============================================================================
" Plugin Configurations
"===============================================================================
" Highlight the acsii banner with green font
hi StartifyHeader ctermfg=76
" Don't change the directory when opening a recent file with a shortcut
let g:startify_change_to_dir = 0
" Set the contents of the banner

let g:startify_custom_header = [
            \"                      `. ___                                          ",
            \"                    __,' __`.                _..----....____          ",
            \"        __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-'         ",
            \"  _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'             ",
            \",'________________                          \`-._`-','                ",
            \" `._              ```````````------...___   '-.._'-:                  ",
            \"    ```--.._      ,.                     ````--...__\-.               ",
            \"            `.--. `-`                       ____    |  |`             ",
            \"              `. `.                       ,'`````.  ;  ;`             ",
            \"                `._`.        __________   `.      \'__/`              ",
            \"                   `-:._____/______/___/____`.     \  `               ",
            \"                               |       `._    `.    \                 ",
            \"                               `._________`-.   `.   `.___            ",
            \"                                                  `------'`           ",
            \]

" The number of files to list.
let g:startify_show_files_number = 10
" A list of files to bookmark. Always shown
let g:startify_bookmarks = [ '~/.vimrc' ]
" Replace startify buffer when opening file from vimfiler
autocmd User Startified setlocal buftype=

"===============================================================================
" Plugin Keymappings
"===============================================================================
" N/A

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
" N/A
