"===============================================================================
" DESCRIPTION:   Wrap a word with a specified function.
" EXAMPLE USAGE: Assuming the following test `someFunction(arg1, arg2)`
"                position the cursor on `arg1` and press <Leader>ww you will
"                be prompted for the text to wrap with if you enter
"                `otherFunc` the line will be modifyed as follows
"                `someFunction(otherFunc(arg1), arg2)`
"===============================================================================
function! WrapWordWith()
python3 << endPython
import vim
from itertools import dropwhile

def python_input(message = 'input'):
    vim.command('call inputsave()')
    vim.command("let user_input = input('" + message + ": ')")
    vim.command('call inputrestore()')
    return vim.eval('user_input')

def get_selection():
    buf = vim.current.buffer
    (lnum1, col1) = buf.mark('<')
    (lnum2, col2) = buf.mark('>')
    lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
    if len(lines) == 1:
        lines[0] = lines[0][col1:col2 + 1]
    else:
        lines[0] = lines[0][col1:]
        lines[-1] = lines[-1][:col2 + 1]
    return "\n".join(lines)

def wrap_with():
    the_chars = {"[": "]", "['": "']", '["': '"]', "(": ")", "('": "')", '("': '")', "": ")"}
    # the_word = vim.eval('expand("<cword>")')
    the_word = get_selection()
    current_line = vim.current.line
    wrap_name = python_input("Wrap with") or 'print'
    cursor_pos = vim.current.window.cursor
    open_char_gen = dropwhile(lambda x: x not in ["[", "(", "'", '"'], wrap_name)
    open_char = "".join(open_char_gen)
    courtesy_opener = "" if open_char else "("
    vim.current.buffer[cursor_pos[0] - 1] = current_line.replace(the_word, "{}{}{}{}".format(wrap_name, courtesy_opener, the_word, the_chars[open_char]))

wrap_with()

endPython
endfunction

command! WrapWith call WrapWordWith()

"===============================================================================
" Function Keymappings
"===============================================================================
vnoremap <Leader>ww :<C-U>WrapWith<CR>

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Wrap word under cursor with method                            <Leader>ww', 'normal <Leader>ww']]
