#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac


command_exists () {
    type "$1" &> /dev/null ;
}


if [ "$machine" == "Mac" ]; then
    echo "Macos, Local"

    echo "create folders"
    mkdir -p $HOME/notes
    mkdir -p $HOME/workspace/forks
    mkdir -p $HOME/workspace/open-source
    mkdir -p $HOME/workspace/personal-repositories
    mkdir -p $HOME/workspace/repositories

    if command_exists brew; then
        echo "brew already installed"
    else
        echo "install brew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    if test -d $HOME/.oh-my-zsh; then
        echo "Directory exists."
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    echo "link ohmyzsh"
    ln -sf $HOME/workspace/personal-repositories/myenv/.zshenv $HOME/.zshenv
    ln -sf $HOME/workspace/personal-repositories/myenv/.zshrc  $HOME/.zshrc

    if command_exists vim; then
        echo "vim already installed"
    else
        echo "install vim"
        brew install vim
    fi

    echo "link vim"
    ln -sf $HOME/workspace/personal-repositories/myenv/.vimrc  $HOME/.vimrc



    if command_exists nvim; then
        echo "neovim already installed"
    else
        echo "install neovim"
        brew install nvim
    fi



    if command_exists tmux; then
        echo "tmux already installed"
    else
        echo "install tmux"
        brew install tmux
    fi

    echo "link tmux"
    ln -sf $HOME/workspace/personal-repositories/myenv/.tmux.conf  $HOME/.tmux.conf

    if test -d $HOME/.tmux/plugins/tpm; then
        echo "Directory exists."
    else
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    # # start a server but don't attach to it
    # tmux start-server
    # # create a new session but don't attach to it either
    # tmux new-session -d
    # # install the plugins
    # ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    # # killing the server is not required, I guess
    # tmux kill-server
    # tmux source-file ~/.tmux.conf


    if command_exists kitty; then
        echo "kitty already installed"
    else
        echo "install kitty"
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    fi
    # "need to run `kitty +kitten themes` afterwards"

    echo "link kitty"
    mkdir -p $HOME/.config/kitty
    ln -sf $HOME/workspace/personal-repositories/myenv/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
fi



