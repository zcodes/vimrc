"
" my personal .vimrc file
"
" Author: zcodes <zcodes@163.com>
"
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

" Plugins {{{1
"
" vundle
Plugin 'VundleVim/Vundle.vim'

if has("win32")
    Plugin 'zcodes/vim-misc'
    Plugin 'zcodes/vim-shell'
endif

" bufexplorer
Plugin 'c9s/bufexplorer'

" nerdtree
Plugin 'scrooloose/nerdtree'

" snipmate and snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Emmet
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
Plugin 'tpope/vim-fugitive'

" SuperTabs
Plugin 'ervandew/supertab'

" Taglist
" Plugin 'zcodes/taglist.vim'
Plugin 'majutsushi/tagbar'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Powerline
" Plugin 'Lokaltog/vim-powerline'

" Update Last Change Time
" Plugin 'vim-scripts/update-time'

" color themes {{{2
" ------------------------------
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'mkarmona/colorsbox'
Plugin 'mkarmona/materialbox'
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
" Plugin 'notpratheek/vim-luna'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'fent/vim-frozen'
" Plugin 'jlund3/colorschemer'
" Plugin 'scheakur/vim-scheakur'
" Plugin 'endel/vim-github-colorscheme'
" Plugin 'nelstrom/vim-mac-classic-theme'
" Plugin 'DAddYE/soda.vim'
"
" 2}}}

" filetype plugin {{{2
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
Plugin 'zcodes/vim-coffee-script'
Plugin 'othree/html5.vim'

" 2}}}

" preview colors
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'lilydjwg/colorizer'

" auto-pairs
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
" 1}}}

filetype plugin indent on
syntax on

" file encodings
" Note: move encoding stuff here for fix listchars option cause invalid
" character error on windows.
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,latin-1

if has("gui_running")
    set guioptions=aegit

    " font setting
    if has("win32")
        set guifont=Source_Code_Pro_Semibold:h12
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
" colorscheme basic-light
colorscheme basic-dark

" editing
set noswapfile " no swapfile when editing
set nobackup " don't create backup files
set backspace=indent,eol,start
set autoread
set nu " show line number
set cursorline " highlight current line
" enable list mode, show tabs, eof, trail ...
set list
set listchars=tab:›\ ,trail:•,precedes:«,extends:»,nbsp:. " ,eol:¬

" mouse setting
set mouse=a
set mousemodel=popup

set smartindent
set autoindent
set nojoinspaces
set splitright
set splitbelow

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

set showmode
set formatoptions=tcqm

if has('statusline')
    set laststatus=2

    set statusline=%<%f
    set statusline+=\ %w%h%m%r
    set statusline+=\ [%{&ff}/%Y]
    set statusline+=\ [%{getcwd()}]
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif
set hidden " allow switch buffer without saving.

" file line endings
set fileformat=unix
set fileformats=unix,dos,mac

if exists('+fixendofline')
    set fixendofline
endif
set foldenable

" searchings
set hlsearch
set incsearch

" no fold
set foldlevel=999

" tabs
set ts=4 sts=4 sw=4 et
autocmd BufNewFile,BufRead *.[ch],*.cpp setl ts=8 sts=8 sw=8 noet
autocmd BufNewFile,BufRead *.rb,*.js,*.jade setl ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.html,*.blade.php setl ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.vue setl ts=2 sts=2 sw=2 filetype=html
autocmd BufNewFile,BufRead *.coffee setl ts=2 sts=2 sw=2 fdm=indent nofen

" 删除空白
autocmd BufWritePre * :%s/\s\+$//e

" php.vim settings
" let g:php_syntax_extensions_enabled = []
" let g:php_syntax_extensions_disabled = []

" Python pymode setting
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
nmap <F5> :TagbarToggle<cr>

" Emmet Settings
" TODO use <tab> expand abbr.
" https://github.com/mattn/emmet-vim/issues/168
let g:user_emmet_install_global = 0
autocmd FileType html,css,blade EmmetInstall

" Taglist settings
" for ubuntu
" this fixed in 'zcodes/taglibs.vim'
" if executable('ctags-exuberant')
"     let Tlist_Ctags_Cmd='ctags-exuberant'
" endif
" let Tlist_Use_Right_Window = 1
" let Tlist_Show_One_File = 1

" Tagbar settings
let g:tagbar_show_linenumbers = 2
let g:tagbar_foldlevel = 2

" airline settings
if has('gui_running')
    let g:airline_theme = 'tomorrow'
else
    let g:airline_theme = 'raven'
endif
let g:airline_powerline_fonts=0

" vim: ts=4 sts=4 sw=4 et fdm=marker:
