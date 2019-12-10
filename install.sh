#!/bin/bash

# set -x
# set -e

BASE_DIR=$(dirname "$0")
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

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

# install fzf
if [ -d "$HOME/.fzf" ]; then
    mv $HOME/.fzf $HOME.fzf.back_$TIMESTAMP
fi
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# install tldr
mkdir -p $HOME/.bin
curl -o $HOME/.bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x $HOME/.bin/tldr

# install eg
if [ -d "$HOME/.eg" ]; then
    mv $HOME/.eg $HOME/.eg.back_$TIMESTAMP
fi
git clone https://github.com/srsudar/eg $HOME/.eg
ln -s $HOME/.eg/eg_exec.py $HOME/.bin/eg

# parse args
while [[ "$#" -gt 0 ]]; do case $1 in
    --with-zsh) zsh=1; shift;;
    --with-tmux) tmux=1; shift;;
    --with-vim) vim=1; shift;;
esac; shift; done

# install oh-my-zsh
if [[ "$zsh" == "1" ]]; then
    zsh/install.sh
fi

# install oh-my-tmux
if [[ "$tmux" == "1" ]];then
    tmux/install.sh
fi

# install spf13-vim
if [[ "$vim" == "1" ]]; then
    vim/install.sh
fi

