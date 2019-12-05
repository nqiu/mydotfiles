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
    echo "vim 8.0 required, please install vim first"
    exit
fi

if ! `which tmux &> /dev/null`; then
    echo "tmux >=2.2 required, please install tmux first"
    exit
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# custom
cp $BASE_DIR/.zshrc $HOME
cp $BASE_DIR/.zshrc.aliases $HOME
cp $BASE_DIR/.zshrc.3party $HOME
cp $BASE_DIR/.zshrc.custom $HOME


# install oh-my-tmux
cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# custom
cp $BASE_DIR/.tmux.conf.local $HOME


# install spf13-vim
curl https://j.mp/spf13-vim3 -L > $BASE_DIR/spf13-vim.sh && sh $BASE_DIR/spf13-vim.sh

# custom
cp $BASE_DIR/.vimrc.local $HOME
cp $BASE_DIR/.vimrc.bundles.local $HOME
cp $BASE_DIR/.vimrc.before.local $HOME

