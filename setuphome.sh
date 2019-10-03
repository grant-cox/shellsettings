#!/bin/bash

mkdir -p $HOME/.config/nvim/
ln -sfv $PWD/.config/nvim/init.vim $HOME/.config/nvim/init.vim

ln -sfv $PWD/.gitconfig $HOME/.gitconfig

ln -sfv $PWD/.screenrc $HOME/.screenrc

ln -sfv $PWD/.tmux.conf $HOME/.tmux.conf

ln -sfv $PWD/.vimrc $HOME/.vimrc

ln -sfv $PWD/.zshrc $HOME/.zshrc



# vim vim-plug setup
if [[ ! -e $HOME/.vim/autoload/plug.vim ]]; then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "setup vim-plug for vim"
fi

# neovim vim-plug setup
if [[ ! -e $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "setup vim-plug for neovim"
fi

# oh-my-zsh
if [[ ! -e $HOME/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
