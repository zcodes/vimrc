"
" File: vimrc
" Author: zcodes <zcodes@qq.com>
" Description: my vimrc
" Last Modified: 五月 23, 2018
" Note: Every thing you need to known about Vim at:
" https://github.com/mhinz/vim-galore
"

" bootstrap {{{
set nocompatible
filetype off

" set $VIMHOME to ~/vimfiles or ~/.vim
let $VIMHOME=expand('<sfile>:p:h')

" before it
if filereadable($VIMHOME . '/vimrc.local.before')
    source $VIMHOME/vimrc.local.before
endif
" }}}
"
" 使用 Vundle 管理插件 {{{
" Vundle: https://github.com/VundleVim/Vundle.vim
exec 'set rtp+=' . expand($VIMHOME . '/bundle/Vundle.vim')
call vundle#begin(expand($VIMHOME . '/bundle'))
" 插件单独分在 vimrc.plugins 文件中
source $VIMHOME/vimrc.plugins
source $VIMHOME/vimrc.colors
call vundle#end()
" }}}
"
" 配置从这里开始
" ==============================
"
" plugin load before indent, see:
" https://stackoverflow.com/questions/2061321/incorrect-comments-set-for-php-in-vim
filetype plugin indent on
syntax on
"
" encoding and format {{{
" 默认编码
set encoding=utf-8
" 脚本编码
scriptencoding utf-8
" 启用支持的文件编码
set fileencodings=utf-8,gbk,gb2312,gb18030,ucs-bom,utf16-le,latin-1
" 可用的换行格式
" Note: unix, dos, mac 三种格式的换行对应:
" unix => \n
" dos  => \r\n
" mac  => \r
set fileformats=unix,dos,mac
" Note: 可用使用下列命令设置当前文件的编码和换行格式
" set fileencoding=<要转换的编码，比如: utf8>
" set fileformat=<要设置的文件还行格式，比如: unix>
" }}}
" 'timeout' and 'ttimeout' {{{
" for details, see :h 'timeout'
" TODO: Differences between `:mappingings and key codes`
"
" Disable timeout for <leader> key sequences.
set notimeout
" set timeoutlen=3000
set ttimeout  " time out for key codes
" set ttimeoutlen=100 " wait up to 100ms after Esc for speical key
" }}}
" editing {{{
"
" let vim remember more
set history=500
set sessionoptions+=slash,unix,globals
"
" 不使用交换文件：不在文件所在目录下产生 .swp 文件
set noswapfile
" 不适用备份文件
set nobackup
" Backspace 按键设置
set backspace=indent,eol,start
" 自动加载修改的文件
set autoread
" set path+=**
" 高亮当前行
set cursorline
" 显示空白字符
" enable list mode, show tabs, eof, trail ...
set list
set listchars=tab:›\ ,trail:•,precedes:«,extends:»,nbsp:.
" ,eol:¬
set viewoptions=folds,options,cursor,unix,slash

" 缩进
set smartindent
set autoindent
set wrap

" join
set nojoinspaces
" 窗口分割
set splitright
set splitbelow

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
    set cmdheight=1
endif

" 显示模式
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

if exists('+fixendofline')
    set fixendofline
endif

" 搜索设置
set ignorecase
set smartcase
set hlsearch
if has('reltime')
    set incsearch
endif
set lazyredraw
set magic
set showmatch
set matchtime=2

" 代码折叠 {{{
if has('folding')
    set foldenable
    set foldlevel=999
    set foldcolumn=3
    set foldmethod=syntax
endif
" }}}

" Show @@@ in the last line if it is truncated
" set display=truncate

" Show a few lines of context around the cursor.
set scrolloff=5

" no bell
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" undo even close files.
try
    let &undodir=expand($VIMHOME . '/undodir')
    set undofile
catch
endtry

" mouse
if has('mouse')
    set mouse=a
    set mousemodel=popup
endif

" color theme
" silent! colorscheme basic-dark
" }}}
" keymaps {{{
"
" Don't use Ex mode, use Q for formating.
map Q gq

" set <leader> key
" let mapleader = ','
" let g:mapleader = ','

" <leader> key with mapping space
" t => tabedit
" v => vim
" vm => vim menubar
" vt => vim toolbar
" 快速编辑配置文件
nnoremap <leader>vi :e $MYVIMRC<cr>
nnoremap <leader>vw :e $MYVIMRC.win<cr>
nnoremap <leader>vp :e $MYVIMRC.plugins<cr>
nnoremap <leader>vll :e $MYVIMRC.local<cr>
nnoremap <leader>vlb :e $MYVIMRC.local.before<cr>

" Editor configures with new tabs
nnoremap <leader>tvi :tabe $MYVIMRC<cr>
nnoremap <leader>tvw :tabe $MYVIMRC.win<cr>
nnoremap <leader>tvp :tabe $MYVIMRC.plugins<cr>
nnoremap <leader>tvll :tabe $MYVIMRC.local<cr>
nnoremap <leader>tvlb :tabe $MYVIMRC.local.before<cr>

" 重新加载配置文件
nnoremap <leader>vss :source $MYVIMRC<cr>

" 使用 j，k 移动时候，将 wrapped 行视作一行移动
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" 使用空格快速输入命令
nnoremap <space> :
vnoremap <space> :

" ctrl-l 清除高亮搜索结果
if maparg('<C-L>', 'n') ==#'' | nnoremap <silent><C-L> :nohlsearch<cr><c-l> | endif

" 自动删除无用的空白字符
function! <SID>StripTrailingWhitespaces()
    let l:l = line('.')
    let l:c = col('.')
    exec '%s/\s\+$//e'
    call cursor(l:l, l:c)
endfun
nnoremap <F6> :call <SID>StripTrailingWhitespaces()<cr>
" }}}
" tabs {{{
" ts : Number of spaces that a <Tab> in the file counts for.
" sts : Number of spaces that a <Tab> counts for while performing editing
" operations, like insert a <Tab> or using <BS>.
" sw: Number of spaces to use for each step of (auto)indent.
" et: In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set tabstop=4 " ts
set softtabstop=4 " sts
set shiftwidth=4 " shiftwidth
set expandtab " et
augroup tabWidth
    au!

    autocmd BufNewFile,BufRead *.html,*.less,*.css,*.js,
                \*.blade.php,*.rb,*.jade setl ts=2 sts=2 sw=2 et
    autocmd BufNewFile,BufRead *.vue setl ts=2 sts=2 sw=2 filetype=html
    autocmd BufNewFile,BufRead *.coffee setl ts=2 sts=2 sw=2 fdm=indent nofen
    autocmd BufNewFile,BufRead *.[ch],*.cpp,*.hpp setl ts=4 sts=4 sw=4 noet
    autocmd BufNewFile,BufRead *.go setl ts=4 sts=4 sw=4 noet
    autocmd BufNewFile,BufRead *.py setl ts=4 sw=4 sts=4 et completeopt=menu,preview
    autocmd BufNewFile,BufRead *.asd set filetype=lisp
    autocmd FileType lisp setl ts=4 sw=4 sts=4 et

    " Semantic UI
    autocmd BufNewFile,BufRead *.overrides,*.variables setl filetype=less
augroup END
" }}}
" autogroups {{{
" php
augroup customCommentString
    autocmd FileType php setlocal commentstring=//\ %s
augroup END

" ruby
augroup MyRubyCustom
    au!

    autocmd FileType ruby compiler ruby
    " execute current editing ruby file directly
    autocmd FileType ruby nnoremap <buffer> <F9> :exec '!ruby' shellescape(@%, 1)<cr>
augroup END

" python
augroup MyPythonCustom
    au!

    " pythom-mode 有 <leader>r 来使用 vim 支持的 Python 来运行 Python 文件
    " 这里使用 <F9> 直接调用 python 来执行脚本，此时的 python 可以是
    " virtualenv 中的 Python
    "
    " TODO 将输出内容直接导入 vim 中
    autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
augroup END

" vim
augroup MyVimCustom
    au!
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
augroup END

" vim 帮助文档设置
augroup MyVimHelp
    au!

    autocmd FileType help setl conceallevel=0
augroup END
hi link HelpBar Normal
hi link HelpStar Normal

" Last Modified
augroup UpdateLastModifiedTimestamps
    au!
    autocmd BufWritePre *.txt,*.md call zcodes#utils#last_modified()
    autocmd BufWritePre ~/{.vim,vimfiles}/{autoload,colors,ftplugin,indent,snippets,syntax}/**.vim call zcodes#utils#last_modified()
augroup END
" }}}
" line number {{{
set number
set relativenumber
" 自动在相对行号间切换
augroup RelativeLineNumbers
    au!

    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END

command! ToggleLineNumber :call ToggleLineNumber()
function! ToggleLineNumber()
    if &number == 1
        set norelativenumber
        set nonumber
    else
        set relativenumber
        set number
    endif
endfunction
" }}}
" commands {{{
"
if !exists(':DiffOrig')
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
"
" reload Local configure (vimrc.local)
if !exists(':ReloadLocalConfigure')
    command ReloadLocalConfigure :exec "source " . $VIMHOME . '/vimrc.local'
endif
" }}}
" load external files {{{
"
" gui
if zcodes#has#gui()
    source $VIMHOME/vimrc.gui
endif
"
" windows
if zcodes#has#windows()
    source $VIMHOME/vimrc.win
endif
"
" local configurations {{{
if filereadable($VIMHOME . '/vimrc.local')
    source $VIMHOME/vimrc.local
endif
" }}}
"
" python3
if zcodes#has#python3()
    source $VIMHOME/vimrc.python3
endif
" }}}
"
" vim: ts=4 sts=4 sw=4 et fdm=marker:
