#!/bin/bash

# nvim 
mkdir -p ~/.config/nvim/
ln -sfv $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim

ln -sfv $PWD/.gitconfig ~/.gitconfig

ln -sfv $PWD/.screenrc ~/.screenrc

ln -sfv $PWD/.tmux.conf ~/.tmux.conf

ln -sfv $PWD/.vimrc ~/.vimrc

ln -sfv $PWD/.zshrc ~/.zshrc
