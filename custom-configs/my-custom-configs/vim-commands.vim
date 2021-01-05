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
