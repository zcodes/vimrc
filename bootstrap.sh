#!/usr/bin/env bash

# install plugins
if [ ! -d ./bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
fi

vim -E -c PluginInstall -c qa
