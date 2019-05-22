#!/bin/bash

set -x
set -e

BASE_DIR=$(dirname "$0")
TIMESTAMP=$(date +%Y%m%d%H%M%S)


# backup .vimrc
#[[ -f "$HOME/.vimrc" ]] && {
    #mv "$HOME/.vimrc" "$HOME/.vimrc_bak_$TIMESTAMP"
#}
# copy .vimrc to user HOME
cp $BASE_DIR/.vimrc $HOME/.vimrc

# install needed packages
#echo "please make sure you have installed: "
#echo "  vim git ack-grep exuberant-ctags pep8 flake8 pyflakes isort yapf"

# install vim plugins
vim +PlugInstall +qa --not-a-term


# backup .zshrc
#[[ -f "$HOME/.zshrc" ]] && {
    #mkdir "$HOME/.zsh_bak_$TIMESTAMP"
    #mv "$HOME/.zshrc" "$HOME/.zsh_bak_$TIMESTAMP/"
#}

# copy .zshrc to user HOME
cp $BASE_DIR/.zshrc $HOME/.zshrc
cp $BASE_DIR/.zshrc.alias $HOME/.zshrc.alias
cp $BASE_DIR/.zshrc.3party $HOME/.zshrc.3party
cp $BASE_DIR/.zshrc.custom $HOME/.zshrc.custom
