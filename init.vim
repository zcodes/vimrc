" init file for neovim
" neovim use ~/.config/neovim/init.vim instead ~/.vimrc or ~/.vim/vimrc as the
" first init file.
exec 'source ' . fnamemodify(expand('<sfile>'), ':p:h:gs?\\?/?') . '/vimrc'
