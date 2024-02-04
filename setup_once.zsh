#!/bin/zsh

echo "create folders"
mkdir -p $HOME/notes
mkdir -p $HOME/workspace/forks
mkdir -p $HOME/workspace/open-source
mkdir -p $HOME/workspace/personal-repositories
mkdir -p $HOME/workspace/repositories

echo "create symlinks"
ln -sf $HOME/workspace/personal-repositories/myenv/.vimrc ~/.vimrc
ln -sf $HOME/workspace/personal-repositories/myenv/.zshrc ~/.zshrc
