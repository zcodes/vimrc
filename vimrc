set nocompatible
filetype off

" use vundle to manage plugins
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin($HOME . '/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

"
"============================
"

"vundle
Plugin 'VundleVim/Vundle.vim'

if has("win32")
    Plugin 'zcodes/vim-misc'
    Plugin 'zcodes/vim-shell'
endif

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
" Plugin 'wimstefan/Lightning'
" Plugin 'romainl/Apprentice'
" Plugin 'vim-scripts/moria'
" Plugin 'vim-scripts/bclear'
" Plugin 'vim-scripts/beauty256'
" Plugin 'iissnan/tangoX'
" Plugin 'vim-scripts/earendel'
" Plugin 'tomasr/molokai'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'zcodes/vim-color-cleanroom'

" let g:molokai_original = 1

" JavaScript
Plugin 'pangloss/vim-javascript'

"markdown
Plugin 'plasticboy/vim-markdown'

" Twig
Plugin 'evidens/vim-twig'

" Blade Template
Plugin 'xsbeats/vim-blade'

" Handlebars
Plugin 'mustache/vim-mustache-handlebars'

" comment
" gcc 注释行
" gc 注释/取消注释块
Plugin 'tpope/vim-commentary'

Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'StanAngeloff/php.vim'

" git plugin
Plugin 'airblade/vim-gitgutter'

" SuperTabs
Plugin 'ervandew/supertab'

" Taglist
Plugin 'zcodes/taglist.vim'

" Puppet file plugin
Plugin 'rodjek/vim-puppet'

" css and less
Plugin 'JulesWang/css.vim'
Plugin 'genoma/vim-less'

" Plugin for python
Plugin 'klen/python-mode'

" Plugin for jade template engine
Plugin 'digitaltoad/vim-jade'

" Plugin for coffee-script
Plugin 'kchmck/vim-coffee-script'

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

    if has("win32")
        set guifont=Fira\ Mono:h11
        set guifontwide=SimHei:h12
        set langmenu=en
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages en_US.utf-8
    else
        set guifont=Fira\ Mono\ 10
        set guifontwide=Source\Sans\ SC\ 10
    endif
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

" no fold
set foldlevel=999

" tabs
set ts=4 sts=4 sw=4 et
autocmd BufNewFile,BufRead *.[ch],*.cpp setl ts=8 sts=8 sw=8 noet
autocmd BufNewFile,BufRead *.rb setl ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.js setl ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.jade setl ts=2 sts=2 sw=2

" 删除空白
autocmd BufWritePre * :%s/\s\+$//e

let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
autocmd BufNewFile,BufRead *.py setl ts=8 et sw=4 sts=4

" Semantic UI
autocmd BufNewFile,BufRead *.overrides,*.variables setl filetype=less

"NERDTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeMinimalUI=1
let NERDTreeDirArrows=0

"key bindings
nmap <F3> :NERDTreeFocus<cr>
nmap <F4> :NERDTreeClose<cr>
nmap <F5> :TlistToggle<cr>

" Taglist settings
if executable('ctags')
    " for msys2
    let Tlist_Ctags_Cmd='ctags'
else
    " for ubuntu
    let Tlist_Ctags_Cmd = 'ctags-exuberant'
endif
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

" vim: ts=4 sts=4 sw=4 et
