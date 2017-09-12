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

function! zcodes#utils#home(file)
    if (empty(a:file))
        return s:vim_home
    endif

    if a:file[0] != '/'
        return s:vim_home . '/' . a:file
    endif

    return s:vim_home . a:file
endfunction

" See: http://vim.wikia.com/wiki/Insert_current_date_or_time
" update 'Last modified: ' timestamps in the first or last twenty lines.
function! zcodes#utils#last_modified()
    if &modified
        let save_cursor = getpos(".")
        let m = max([1, line("$") - 20])
        let n = min([20, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
                    \ strftime('%c') . '#e'

        keepjumps exe m . ',' . line("$") . 's#^\(.\{,10}Last modified: \).*#\1' .
                    \ strftime('%c') . '#e'

        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfunction


