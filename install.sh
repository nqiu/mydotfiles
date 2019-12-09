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

# parse args
while [[ "$#" -gt 0 ]]; do case $1 in
    --with-zsh) zsh=1; shift;;
    --with-tmux) tmux=1; shift;;
    --with-vim) vim=1; shift;;
esac; shift; done

# install oh-my-zsh
if [[ "$zsh" -eq "1" ]]; then
    zsh/install.sh
fi


# install oh-my-tmux
if [[ "$tmux" -eq "1" ]];then
    tmux/install.sh
fi


# install spf13-vim
if [[ "$vim" -eq "1" ]]; then
    vim/install.sh
fi

