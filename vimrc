"
" my personal .vimrc file
"
" Author: zcodes <zcodes@163.com>
"
set nocompatible
filetype off

" use vundle to manage plugins
if has("win32")
    let s:vim_home = expand('~/vimfiles')
else
    let s:vim_home = expand('~/.vim')
endif
exec 'set rtp+=' . s:vim_home . '/bundle/Vundle.vim'
call vundle#begin(s:vim_home . '/bundle')

" include plugins
if filereadable(s:vim_home . '/vimrc.plugins')
    exec 'source ' . s:vim_home . '/vimrc.plugins'
endif

call vundle#end()

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
    set cursorline " highlight current line

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
" enable list mode, show tabs, eof, trail ...
set list
exec 'set listchars=tab:›\ ,trail:•,precedes:«,extends:»,nbsp:.'
" ,eol:¬

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
autocmd BufNewFile,BufRead *.html,*.less,*.css,*.js,
            \*.blade.php,*.rb,*.jade setl ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.vue setl ts=2 sts=2 sw=2 filetype=html
autocmd BufNewFile,BufRead *.coffee setl ts=2 sts=2 sw=2 fdm=indent nofen
autocmd BufNewFile,BufRead *.[ch],*.cpp setl ts=8 sts=8 sw=8 noet

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
" https://github.com/mattn/emmet-vim/issues/168
let g:user_emmet_install_global = 0
let g:user_emmet_complete_tag = 1
autocmd FileType html,css,blade,twig EmmetInstall

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

if has("win32") && filereadable(s:vim_home . '/vimrc.win')
    exec 'source ' . s:vim_home . '/vimrc.win'
endif

" vim: ts=4 sts=4 sw=4 et fdm=marker:
