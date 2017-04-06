"
" vim 配置文件
"
" Author: zcodes <zcodes@163.com>
"
" Note: Every thing you need to known about Vim at:
" https://github.com/mhinz/vim-galore
"
" =====================================================

set nocompatible
filetype off

" 使用 Vundle 管理插件 {{{
" Vundle: https://github.com/VundleVim/Vundle.vim
exec 'set rtp+=' . zcodes#utils#vim_home_file('/bundle/Vundle.vim')
call vundle#begin(zcodes#utils#vim_home_file('/bundle'))
" 插件单独分在 vimrc.plugins 文件中
call zcodes#utils#source(zcodes#utils#vim_home_file('/vimrc.plugins'))
call vundle#end()
" }}}

" before it
call zcodes#utils#source(zcodes#utils#vim_home_file('/vimrc.local.before'))

"
" 配置从这里开始
" ==============================

" 让 Vim 记住更多
set history=500

filetype indent on
filetype plugin on
syntax on

" 脚本编码
scriptencoding utf-8
" 默认编码
set encoding=utf-8
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

" {{{ GUI
if zcodes#has#gui()
    set anti
    set guioptions=aegit
endif
" }}}

set ttimeout  " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for speical key

" 代码颜色主题
" 自制 vim 主题，平时以 basic-dark 为主
silent! colorscheme basic-dark

" editing
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

" 鼠标设置
if has('mouse')
    set mouse=a
    set mousemodel=popup
endif

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

" 代码折叠
set foldenable
set foldlevel=999
set foldcolumn=1

" Show @@@ in the last line if it is truncated
" set display=truncate

" Show a few lines of context around the cursor.
set scrolloff=5

" no bell
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" undo even close files.
try
    let &undodir=zcodes#utils#vim_home_file('/undodir')
    set undofile
catch
endtry


" 按键绑定 {{{
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
if zcodes#has#gui()
    nnoremap <leader>vms :if &go=~#'m'<bar>set go-=m<bar>else<bar>set go+=m<bar>endif<cr>
    nnoremap <leader>vts :if &go=~#'T'<bar>set go-=T<bar>else<bar>set go+=T<bar>endif<cr>
endif

" 使用 j，k 移动时候，将 wrapped 行视作一行移动
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" 使用空格快速输入命令
nnoremap <space> :
vnoremap <space> :

" ctrl-l 清除高亮搜索结果
if maparg('<C-L>', 'n') ==#'' | nnoremap <silent><C-L> :nohlsearch<cr><c-l> | endif
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
                \*.blade.php,*.rb,*.jade setl ts=2 sts=2 sw=2
    autocmd BufNewFile,BufRead *.vue setl ts=2 sts=2 sw=2 filetype=html
    autocmd BufNewFile,BufRead *.coffee setl ts=2 sts=2 sw=2 fdm=indent nofen
    autocmd BufNewFile,BufRead *.[ch],*.cpp,*.hpp setl ts=4 sts=4 sw=4 noet
    autocmd BufNewFile,BufRead *.go setl ts=4 sts=4 sw=4 noet
    autocmd BufNewFile,BufRead *.py setl ts=4 sw=4 sts=4 et

    " Semantic UI
    autocmd BufNewFile,BufRead *.overrides,*.variables setl filetype=less
augroup END
" }}}

" Ruby 配置 {{{
augroup MyRubyCustom
    au!

    autocmd FileType ruby compiler ruby
    " execute current editing ruby file directly
    autocmd FileType ruby nnoremap <buffer> <F9> :exec '!ruby' shellescape(@%, 1)<cr>
augroup END
" }}}

" Python 配置 {{{
augroup MyPythonCustom
    au!

    " pythom-mode 有 <leader>r 来使用 vim 支持的 Python 来运行 Python 文件
    " 这里使用 <F9> 直接调用 python 来执行脚本，此时的 python 可以是
    " virtualenv 中的 Python
    "
    " TODO 将输出内容直接导入 vim 中
    autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
augroup END
" }}}

" 自动删除无用的空白字符 {{{
augroup whiteSpace
    au!

    " remove whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup vimStartup
    au!

    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
augroup END
" }}}

" vim 帮助文档设置 {{{
augroup VimHelp
    au!

    autocmd FileType help setl conceallevel=0
augroup END
hi link HelpBar Normal
hi link HelpStar Normal
" }}}

" 行号 {{{
set nu
set relativenumber
" 自动在相对行号间切换
augroup RelativeLineNumbers
    au!

    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END
" }}}

" Last Modified {{{
augroup UpdateLastModifiedTimestamps
    au!

    autocmd BufWritePre *.txt,*.md call zcodes#utils#last_modified()
augroup END
" }}}

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" Windows 下 Vim的配置: vimrc.win {{{
if zcodes#has#windows()
    call zcodes#utils#source(zcodes#utils#vim_home_file('/vimrc.win'))
endif
" }}}

" 加载自定义文件 vimrc.local {{{
call zcodes#utils#source(zcodes#utils#vim_home_file('/vimrc.local'))
" }}}

" vim: ts=4 sts=4 sw=4 et fdm=marker:
