set nocompatible
filetype off

" use vundle to manage plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
"============================
"

"vundle
Plugin 'gmarik/Vundle.vim'
" bufexplorer
Plugin 'c9s/bufexplorer'
" nerdtree
Plugin 'scrooloose/nerdtree'

"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"snippets
Plugin 'honza/vim-snippets'

"Emmet
" C-y , expand expression
Plugin 'mattn/emmet-vim'

" File Searching
Plugin 'rking/ag.vim'
let g:agprg="ag --column"

" color themes
" tomorrow theme: https://github.com/chriskempson/tomorrow-theme
"Plugin 'vim-scripts/earendel'
"Plugin 'tomasr/molokai'
"Plugin 'altercation/vim-colors-solarized'

" let g:molokai_original = 1

"markdown
Plugin 'plasticboy/vim-markdown'

" comment
" gcc 注释行
" gc 注释/取消注释块
Plugin 'tpope/vim-commentary'

Plugin 'kien/ctrlp.vim'

"
"============================
"
call vundle#end()
filetype plugin indent on
syntax on


if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=b
    set guioptions-=L

    set guifont=Consolas\ 11
    set guifontwide=Microsoft\ Yahei\ 10
    colorscheme evening
else
    colorscheme elflord
endif

" editing
set noswapfile
set nobackup
set backspace=indent,eol,start
set autoread
set nu

set smartindent
set autoindent
set ruler
set showcmd
set showmode

" file encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,latin-1

" file line endings
set fileformat=unix
set fileformats=unix,dos,mac

" searchings
set hlsearch
set incsearch

" tabs
set ts=4 sts=4 sw=4 et
autocmd BufNewFile,BufRead *.[ch],*.cpp setl ts=8 sts=8 sw=8 noet
autocmd BufNewFile,BufRead *.rb setl ts=2 sts=2 sw=2

"key bindings
nmap <F3> :NERDTreeToggle<cr>
nmap <F4> :NERDTreeFocus<cr>

" vim: ts=4 sts=4 sw=4 et
