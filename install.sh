#!/bin/bash

# set -x
# set -e

BASE_DIR=$(dirname "$0")

# Requirements
if ! `which git &> /dev/null`; then
    echo "git required, please install git first"
    exit
fi
if ! `which curl &> /dev/null`; then
    echo "curl required, please install curl first"
    exit
fi

if ! `which zsh &> /dev/null`; then
    echo "zsh required, please install zsh first"
    exit
fi

if ! `which vim &> /dev/null`; then
    echo "vim 8.1 or above required, please install vim first"
    exit
fi

if ! `which tmux &> /dev/null`; then
    echo "tmux >=2.2 required, please install tmux first"
    exit
fi

# install oh-my-zsh
zsh/install.sh


# install oh-my-tmux
tmux/install.sh


# install spf13-vim
vim/install.sh

