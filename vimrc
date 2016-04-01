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
" ==============================
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

"snipmate and snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

"Emmet
" C-y , expand expression
Plugin 'mattn/emmet-vim'

" File Searching
Plugin 'rking/ag.vim'
let g:ag_prg="ag --vimgrep"

" comment
Plugin 'tpope/vim-commentary'

" Ctrl-P find file
Plugin 'kien/ctrlp.vim'

" git plugin
Plugin 'airblade/vim-gitgutter'

" SuperTabs
Plugin 'ervandew/supertab'

" Taglist
Plugin 'zcodes/taglist.vim'

" ------------------------------
" color themes
" ------------------------------
" Plugin 'chriskempson/tomorrow-theme'
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
" Plugin 'marciomazza/vim-brogrammer-theme'
" Plugin 'jscappini/material.vim'
" Plugin 'mhinz/vim-janah'
" Plugin 'the31k/vim-colors-tayra'
" Plugin 'GGalizzi/cake-vim'
" Plugin 'DeepAnchor/enigma.vim'
" Plugin 'vim-scripts/obsidian2.vim'
" Plugin 'trevorrjohn/vim-obsidian'
" Plugin 'adampasz/stonewashed-themes'
" Plugin 'petelewis/vim-evolution'
" Plugin 'mkarmona/colorsbox'
" Plugin 'notpratheek/vim-luna'
" Plugin 'mkarmona/materialbox'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'fent/vim-frozen'
" Plugin 'jlund3/colorschemer'
" Plugin 'scheakur/vim-scheakur'

" ------------------------------
" filetype plugin
" ------------------------------
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'evidens/vim-twig'
Plugin 'xsbeats/vim-blade'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-ruby/vim-ruby'
Plugin 'StanAngeloff/php.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'JulesWang/css.vim'
Plugin 'genoma/vim-less'
Plugin 'klen/python-mode'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'

"
" ==============================
"
call vundle#end()
filetype plugin indent on
syntax on


if has("gui_running")
    set guioptions=aegit

    " font setting
    if has("win32")
        set guifont=Fira\ Mono:h11
        set guifontwide=SimHei:h12

        " fix menu encoding in windows.
        set langmenu=en
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages en_US.utf-8
    else
        set guifont=Fira\ Mono\ Medium\ 12
        set guifontwide=思源黑体\ Medium\ 12
    endif
endif

" color scheme settings
colorscheme basic-dark

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
set formatoptions=tcqm

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
autocmd BufNewFile,BufRead *.rb,*.js,*.jade,*.coffee setl ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.vue setl ts=2 sts=2 sw=2 filetype=html

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
" for ubuntu
" this fixed in 'zcodes/taglibs.vim'
" if executable('ctags-exuberant')
"     let Tlist_Ctags_Cmd='ctags-exuberant'
" endif
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

" vim: ts=4 sts=4 sw=4 et
