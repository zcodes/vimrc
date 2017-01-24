"
" vim 配置文件
"
" Author: zcodes <zcodes@163.com>
"
set nocompatible
filetype off

" 使用 Vundle 管理插件
" 项目地址: https://github.com/VundleVim/Vundle.vim
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

filetype plugin indent on
syntax on

" 文件编码设置
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030,ucs-bom,utf16-le,latin-1

if has("gui_running")
    set guioptions=aegit
    set cursorline " highlight current line

    " font setting
    if has("win32")
        " fix menu encoding in windows.
        set langmenu=en
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages en_US.utf-8

        set guioptions-=t
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
set foldenable

" searchings
set hlsearch
if has('reltime')
    set incsearch
endif

" no fold
set foldlevel=999

" Show @@@ in the last line if it is truncated
" set display=truncate

" Show a few lines of context around the cursor.
set scrolloff=5

" Don't use Ex mode, use Q for formating.
map Q gq

" tabs
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

augroup MyRubyCustom
    autocmd FileType ruby compiler ruby
    " execute current editing ruby file directly
    autocmd FileType ruby nmap <Leader>e :!ruby %<cr>
augroup END

" php.vim settings
" let g:php_syntax_extensions_enabled = []
" let g:php_syntax_extensions_disabled = []

" Python pymode setting
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
" let max line length is 120
" let g:pymode_options_max_line_length=120

" Vim-go settings
" use :GoInstallBinaries install additional tools
" and set it's installtion path
" let g:go_bin_path = expand("~/.gotools")
" syntax-highlighting options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" By default vim-go shows errors for the fmt command, to disable it:
" let g:go_fmt_fail_silently = 1
" Disable auto fmt on save:
" let g:go_fmt_autosave = 0
" Disable opening browser after posting your snippet to play.golang.org:
let g:go_play_open_browser = 0
" Disable updating dependencies when installing/updating binaries:
let g:go_get_update = 0

" keybinds for vim-go
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)

" other keys, just comment here.
" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" au FileType go nmap <Leader>s <Plug>(go-implements)
" au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>e <Plug>(go-rename)

" SuperTab Settings
" g:SuperTabDefaultCompletionType
" g:SuperTabContextDefaultCompletionType
" b:SuperTabContextDefaultCompletionType
let g:SuperTabDefaultCompletionType = 'context'

autocmd FileType html,css,blade,twig
            \ if &omnifunc != '' |
            \   call SuperTabChain(&omnifunc, "<c-p>") |
            \ endif

" https://github.com/mattn/emmet-vim/issues/168
" TODO snipmate position not work !
function! s:emmet_with_snipmate()
    if snipMate#CanBeTriggered()
        return "\<plug>snipMateNextOrTrigger"
    endif

    let line = getline('.')
    if col('.') < len(line)
        let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')

        if len(line) >= 2
            return "\<Plug>(emmet-move-next)"
        endif
    endif

    if pumvisible()
        return "\<c-n>"
    endif

    if emmet#isExpandable()
        return "\<plug>(emmet-expand-abbr)"
    endif

    return "\<tab>"
endfunction
auto FileType html,css,blade,twig imap <buffer><expr><tab> <sid>emmet_with_snipmate()

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

if has("win32") && filereadable(s:vim_home . '/vimrc.win')
    exec 'source ' . s:vim_home . '/vimrc.win'
endif

" 加载自定义文件 vimrc.local
if filereadable(s:vim_home . '/vimrc.local')
    exec 'source ' . s:vim_home . '/vimrc.local'
endif

" vim: ts=4 sts=4 sw=4 et fdm=marker:
