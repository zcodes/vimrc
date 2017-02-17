"
" vim 配置文件
"
" Author: zcodes <zcodes@163.com>
"
set nocompatible
filetype off

" 使用 Vundle 管理插件 {{{
" Vundle: https://github.com/VundleVim/Vundle.vim
if has("win32")
    let s:vim_home = expand('~/vimfiles')
else
    let s:vim_home = expand('~/.vim')
endif
exec 'set rtp+=' . s:vim_home . '/bundle/Vundle.vim'
call vundle#begin(s:vim_home . '/bundle')

" 插件单独分在 vimrc.plugins 文件中
if filereadable(s:vim_home . '/vimrc.plugins')
    exec 'source ' . s:vim_home . '/vimrc.plugins'
endif

call vundle#end()
" }}}

"
" 配置从这里开始
"
filetype plugin indent on
syntax on

" 文件编码设置
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030,ucs-bom,utf16-le,latin-1

if has#gui()
    set cursorline " highlight current line

    " font setting
    if has("win32")
        " fix menu encoding in windows.
        " TODO 在Windows上只能用中文的时候工具栏提示不乱码
        source $VIMRUNTIME/delmenu.vim
        let $LANG='zh_CN.UTF-8'
        set langmenu=zh_CN.UTF-8
        source $VIMRUNTIME/menu.vim
        language mes zh_CN.UTF-8

        set guioptions=amegi
    else
        set guioptions=amegit
    endif
endif

set ttimeout  " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for speical key

" color scheme settings
" 自制 vim 主题，平时以 basic-dark 为主
" colorscheme basic-light
silent! colorscheme basic-dark

" editing
set noswapfile " no swapfile when editing
set nobackup " don't create backup files
set backspace=indent,eol,start
set autoread
" set path+=**
set nu " show line number
" enable list mode, show tabs, eof, trail ...
set list
exec 'set listchars=tab:›\ ,trail:•,precedes:«,extends:»,nbsp:.'
" ,eol:¬

" mouse setting
if has('mouse')
    set mouse=a
    set mousemodel=popup
endif

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

" searchings
set hlsearch
if has('reltime')
    set incsearch
endif

" 代码折叠
set foldenable
set foldlevel=999

" Show @@@ in the last line if it is truncated
" set display=truncate

" Show a few lines of context around the cursor.
set scrolloff=5


" 按键绑定 {{{
"
" Don't use Ex mode, use Q for formating.
map Q gq
" 快速编辑配置文件
nnoremap <leader>evi :e $MYVIMRC<cr>
nnoremap <leader>evw :e $MYVIMRC.win<cr>
nnoremap <leader>evp :e $MYVIMRC.plugins<cr>
" 重新加载配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>
if has#gui()
    nnoremap <leader>mv :if &go=~#'m'<bar>set go-=m<bar>else<bar>set go+=m<bar>endif<cr>
    nnoremap <leader>Tv :if &go=~#'T'<bar>set go-=T<bar>else<bar>set go+=T<bar>endif<cr>
endif
inoremap jk <esc>

" 使用空格快速输入命令
nnoremap <space> :
vnoremap <space> :
" ctrl-l 清除高亮搜索结果
if maparg('<C-L>', 'n') ==#'' | nnoremap <silent><C-L> :nohlsearch<cr><c-l> | endif
" }}}

" tabs {{{
set ts=4 sts=4 sw=4 et
augroup tabWidth
    autocmd BufNewFile,BufRead *.html,*.less,*.css,*.js,
                \*.blade.php,*.rb,*.jade setl ts=2 sts=2 sw=2
    autocmd BufNewFile,BufRead *.vue setl ts=2 sts=2 sw=2 filetype=html
    autocmd BufNewFile,BufRead *.coffee setl ts=2 sts=2 sw=2 fdm=indent nofen
    autocmd BufNewFile,BufRead *.[ch],*.cpp setl ts=8 sts=8 sw=8 noet
    autocmd BufNewFile,BufRead *.go setl ts=4 sts=4 sw=4 noet
    autocmd BufNewFile,BufRead *.py setl ts=8 et sw=4 sts=4

    " Semantic UI
    autocmd BufNewFile,BufRead *.overrides,*.variables setl filetype=less
augroup END
" }}}

augroup MyRubyCustom
    autocmd FileType ruby compiler ruby
    " execute current editing ruby file directly
    autocmd FileType ruby nmap <Leader>e :!ruby %<cr>
augroup END

if has('autocmd')
    augroup whiteSpace
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
endif

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" Windows 下 Vim的配置: vimrc.win
if has("win32") && filereadable(s:vim_home . '/vimrc.win')
    exec 'source ' . s:vim_home . '/vimrc.win'
endif

" 加载自定义文件 vimrc.local
if filereadable(s:vim_home . '/vimrc.local')
    exec 'source ' . s:vim_home . '/vimrc.local'
endif

" vim: ts=4 sts=4 sw=4 et fdm=marker:
