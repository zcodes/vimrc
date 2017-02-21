" check colorscheme exist or not.
" http://stackoverflow.com/questions/5698284
function! has#colorscheme(name)
    pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

" check has gui or not
function! has#gui()
    return has("gui_running")
endfunction

" check is Windows or not
function! has#windows()
    return has("win32") || has("win64")
endfunction

" check is Linux or not
function! has#linux()
    return !has#windows() && substitute(system('uname'), "\n", "", "") == 'Linux'
endfunction

