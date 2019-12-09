#!/bin/zsh

set -e

TMUX_BASE_DIR=`dirname "$0"`
TIMESTAMP=`date +"%Y%m%d%H%M%S"`

# make sure tmux 2 is installed
if ! `which tmux &> /dev/null`; then
    echo "tmux 2 is required, please install tmux first"
fi


# install gpakosz/.tmux
if [ -d "$HOME/.tmux" ]; then
    mv $HOME/.tmux $HOME/.tmux.back_$TIMESTAMP
fi
if [ -f "$HOME/.tmux.conf.local" ]; then
    mv $HOME/.tmux.conf.local $HOME/.tmux.conf.local.back_$TIMESTAMP
fi
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
cp $HOME/.tmux/.tmux.conf.local $HOME


# custom
if [ -f "$TMUX_BASE_DIR/_DOT_tmux.conf.local" ]; then
    cp -f $TMUX_BASE_DIR/_DOT_tmux.conf.local $HOME/.tmux.conf.local
fi

