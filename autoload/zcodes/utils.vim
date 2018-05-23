" File: utils.vim
" Author: zcodes <zcodes@qq.com>
" Description: utils
" Last Modified: 2018/5/23 17:40:17
"
if exists('g:zcodes_utils_loaded')
    finish
endif
let g:zcodes_utils_loaded = 1

if zcodes#has#windows()
    let s:vim_home = expand('~/vimfiles')
else
    let s:vim_home = expand('~/.vim')
endif

function! zcodes#utils#source(path)
    if filereadable(a:path)
        exec 'source ' . a:path
    endif
endfunction

function! zcodes#utils#home(...)
    if (a:0 == 0)
        return s:vim_home
    endif

    if a:1[0] !=# '/'
        return s:vim_home . '/' . a:1
    endif

    return s:vim_home . a:1
endfunction

" See: http://vim.wikia.com/wiki/Insert_current_date_or_time
" update 'Last modified: ' timestamps in the first or last twenty lines.
function! zcodes#utils#last_modified()
    if &modified
        let l:save_cursor = getpos('.')
        let l:m = max([1, line('$') - 10])
        let l:n = min([10, line('$')])
        keepjumps exe '1,' . l:n . 's#^\(.*Last \([cC]hange\|[mM]odified\):\s*\).*#\1' .
                    \ strftime('%c') . '#e'

        keepjumps exe l:m . ',' . line('$') . 's#^\(.*Last \([cC]hange\|[mM]odified\):\s*\).*#\1' .
                    \ strftime('%c') . '#e'

        call histdel('search', -1)
        call setpos('.', l:save_cursor)
    endif
endfunction
" vim: ts=4 sts=4 sw=4 et
