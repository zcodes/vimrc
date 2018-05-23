scriptencoding utf-8

" 自定义 vimwiki 的按键绑定，解决 snipmate 和 vim-choosewin 的按键冲突
nmap <silent><buffer> <S-PageDown> <Plug>VimwikiRemoveHeaderLevel
nmap <silent><buffer> <S-PageUp> <Plug>VimwikiAddHeaderLevel
inoremap <expr> <buffer> <C-Tab> vimwiki#tbl#kbd_tab()
inoremap <expr> <buffer> <S-Tab> vimwiki#tbl#kbd_shift_tab()
