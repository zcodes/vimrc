" feature test
if exists('g:zcodes_has_loaded')
    finish
endif
let g:zcodes_has_loaded = 1

" check colorscheme exist or not.
" http://stackoverflow.com/questions/5698284
function! zcodes#has#colorscheme(name)
    pat = 'colors/' . a:name . '.vim'
    return !empty(globpath(&rtp, pat))
endfunction

function! zcodes#has#gui()
    return has('gui_running')
endfunction

function! zcodes#has#windows()
    return has('win16') || has('win32') || has('win64')
endfunction

function! zcodes#has#linux()
    return !has#windows() && substitute(system('uname'), '\n', '', '') == 'Linux'
endfunction

function! zcodes#has#python3()
    return has('python3')
endfunction
