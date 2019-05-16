" Description: utils functions
"
" Author: zcodes <zcodes@qq.com>
" Last Modified: 2019/04/28 16:04
"

if exists('g:loaded_zcodes_z')
    finish
endif
let g:loaded_zcodes_z = 1

" z#is {{{
function! z#is_gui()
    return has('gui_running')
endfunction

function! z#is_win()
    return has('win32')
endfunction

function! z#is_linux()
    return !z#is_win() && substitute(system('uname'), '\n', '', '') ==# 'Linux'
endfunction
" }}}
" z#has {{{
"
" check colorscheme exist or not.
" http://stackoverflow.com/questions/5698284
function! z#has_colorscheme(name)
    let l:pat = 'colors/' . a:name . '.vim'
    return !empty(globpath(&runtimepath, l:pat))
endfunction

function! z#has_py3()
    return has('python3')
endfunction
" }}}
" z#util {{{
" See: http://vim.wikia.com/wiki/Insert_current_date_or_time
" update 'Last modified: ' timestamps in the first or last twenty lines.
function! z#last_modified()
    if &modified
        let l:save_cursor = getpos('.')
        let l:m = max([1, line('$') - 10])
        let l:n = min([10, line('$')])
        keepjumps exe '1,' . l:n . 's#^\(.*Last \([cC]hange\|[mM]odified\):\s*\).*#\1' .
                    \ strftime('%Y/%m/%d %H:%M') . '#e'

        keepjumps exe l:m . ',' . line('$') . 's#^\(.*Last \([cC]hange\|[mM]odified\):\s*\).*#\1' .
                    \ strftime('%Y/%m/%d %H:%M') . '#e'

        call histdel('search', -1)
        call setpos('.', l:save_cursor)
    endif
endfunction
" }}}
" vim: fdm=marker
