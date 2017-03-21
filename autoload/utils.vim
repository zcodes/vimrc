" See: http://vim.wikia.com/wiki/Insert_current_date_or_time
" update 'Last modified: ' timestamps in the first or last twenty lines.
function! utils#LastModified()
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
endfunc

" 加载文件
function! utils#Source(path)
    if filereadable(a:path)
        exec 'source ' . a:path
    endif
endfunc
