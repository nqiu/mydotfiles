#!/bin/bash

set -e

ZSH_BASE_DIR=`dirname "$0"`
TIMESTAMP=`date +"%Y%m%d%H%M%S"`

# install ohmyzsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh.back_$TIMESTAMP
fi
if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc.back_$TIMESTAMP
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"


# install zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open
if [ -d "$HOME/.asdf" ]; then
    mv $HOME/.asdf $HOME/.asdf.back_$TIMESTAMP
fi
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
if [ -d "$HOME/.autoenv" ]; then
    mv $HOME/.autoenv $HOME/.autoenv.back_$TIMESTAMP
fi
git clone git://github.com/inishchith/autoenv.git ~/.autoenv

# install zsh-themes
git clone https://github.com/denysdovhan/spaceship-prompt.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/spaceship.zsh-theme"
git clone https://github.com/halfo/lambda-mod-zsh-theme "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/lambda-mod"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/lambda-mod/lambda-mod.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/lambda-mod.zsh-theme"
git clone https://github.com/fjpalacios/elessar-theme.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/elessar-theme"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/elessar-theme/elessar.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/elessar.zsh-theme"
git clone https://github.com/Saleh7/igeek-zsh-theme.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/igeek-zsh-theme"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/igeek-zsh-theme/igeek.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/igeek.zsh-theme"
git clone https://github.com/w33tmaricich/enlightenment.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/enlightenment"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/enlightenment/enlightenment.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/enlightenment.zsh-theme"
git clone https://github.com/tobyjamesthomas/pi.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/pi"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/pi/pi.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/pi.zsh-theme"
git clone https://github.com/blyndusk/sm-theme.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/sm-theme"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/sm-theme/sm.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/sm.zsh-theme"
git clone https://github.com/ergenekonyigit/lambda-gitster.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/lambda-gitster"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/lambda-gitster/lambda-gitster.zsh-theme" "${ZSH:-~/.oh-my-zsh}/themes/lambda-gitster.zsh-theme"



# custom
# if [ -f "$HOME/.zshrc" ]; then
#     mv $HOME/.zshrc $HOME/.zshrc.back_$TIMESTAMP
# fi
cp -f $ZSH_BASE_DIR/_DOT_zshrc $HOME/.zshrc
if [ -f "$HOME/.zshrc.aliases" ]; then
    mv $HOME/.zshrc.aliases $HOME/.zshrc.aliases.back_$TIMESTAMP
fi
cp $ZSH_BASE_DIR/_DOT_zshrc.aliases $HOME/.zshrc.aliases
if [ -f "$HOME/.zshrc.custom" ]; then
    mv $HOME/.zshrc.custom $HOME/.zshrc.custom.back_$TIMESTAMP
fi
cp $ZSH_BASE_DIR/_DOT_zshrc.custom $HOME/.zshrc.custom
if [ -f "$HOME/.zprofile" ]; then
    mv $HOME/.zprofile $HOME/.zprofile.back_$TIMESTAMP
fi
cp $ZSH_BASE_DIR/_DOT_zprofile $HOME/.zprofile

