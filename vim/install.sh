#/bin/zsh

set -e

VIM_BASE_DIR=`dirname "$0"`
TIMESTAMP=`date +"%Y%m%d%H%M%S"`

# make sure vim is installed
if ! `which vim &> /dev/null`; then
    echo "vim 8.1 or above is required, please install vim first"
fi

# install spf13-vim
curl https://j.mp/spf13-vim3 -L > $VIM_BASE_DIR/spf13-vim.sh && sh $VIM_BASE_DIR/spf13-vim.sh

# custom
if [ -f "$HOME/.vimrc.local" ]; then
    mv $HOME/.vimrc.local $HOME/.vimrc.local.back_$TIMESTAMP
fi
cp $VIM_BASE_DIR/_DOT_vimrc.local $HOME/.vimrc.local
if [ -f "$HOME/.vimrc.bundles.local" ]; then
    mv $HOME/.vimrc.bundles.local $HOME/.vimrc.bundles.local.back_$TIMESTAMP
fi
cp $VIM_BASE_DIR/_DOT_vimrc.bundles.local $HOME/.vimrc.bundles.local
if [ -f "$HOME/.vimrc.before.local" ]; then
    mv $HOME/.vimrc.before.local $HOME/.vimrc.before.local.back_$TIMESTAMP
fi
cp $VIM_BASE_DIR/_DOT_vimrc.before.local $HOME/.vimrc.before.local

# remove tmp
rm -rf $VIM_BASE_DIR/spf13-vim.sh
