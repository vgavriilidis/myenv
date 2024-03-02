#!/bin/zsh

echo "create folders"
mkdir -p $HOME/notes
mkdir -p $HOME/workspace/forks
mkdir -p $HOME/workspace/open-source
mkdir -p $HOME/workspace/personal-repositories
mkdir -p $HOME/workspace/repositories

echo "create symlinks"
ln -sf $HOME/workspace/personal-repositories/myenv/.vimrc  $HOME/.vimrc
ln -sf $HOME/workspace/personal-repositories/myenv/.zshenv $HOME/.zshenv
ln -sf $HOME/workspace/personal-repositories/myenv/.zshrc  $HOME/.zshrc


# if kitty is installed TODO
mkdir -p $HOME/.conf/kitty
ln -sf $HOME/workspace/personal-repositories/myenv/kitty/kitty.conf $HOME/.conf/kitty/kitty.conf

