#!/bin/bash

set -e

ZSH_BASE_DIR=`dirname "$0"`
TIMESTAMP=`date +"%Y%m%d%H%M%S"`

# install ohmyzsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh.back_$TIMESTAMP
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"


# install zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf

# install zsh-themes
git clone https://github.com/denysdovhan/spaceship-prompt.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/spaceship.zsh-theme"
git clone https://github.com/halfo/lambda-mod-zsh-theme "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/lambda-mod"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/lambda-mod/lambda-mod.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/lambda-mod.zsh-theme"

# custom
if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc.back_$TIMESTAMP
fi
cp $ZSH_BASE_DIR/_DOT_zshrc $HOME/.zshrc
if [ -f "$HOME/.zshrc.aliases" ]; then
    mv $HOME/.zshrc.aliases $HOME/.zshrc.aliases.back_$TIMESTAMP
fi
cp $ZSH_BASE_DIR/_DOT_zshrc.aliases $HOME/.zshrc.aliases
if [ -f "$HOME/.zshrc.3party" ]; then
    mv $HOME/.zshrc.3party $HOME/.zshrc.3party.back_$TIMESTAMP
fi
cp $ZSH_BASE_DIR/_DOT_zshrc.3party $HOME/.zshrc.3party
if [ -f "$HOME/.zshrc.custom" ]; then
    mv $HOME/.zshrc.custom $HOME/.zshrc.custom.back_$TIMESTAMP
fi
cp $ZSH_BASE_DIR/_DOT_zshrc.custom $HOME/.zshrc.custom

