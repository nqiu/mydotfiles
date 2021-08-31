# install ohmyzsh
sh -c "$(wget -O- --no-check-certificate https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf

# install ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME:-~/.oh-my-zsh}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME:-~/.oh-my-zsh}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${HOME:-~/.oh-my-zsh}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions ${HOME:-~/.oh-my-zsh}/plugins/zsh-completions
echo 'autoload -U compinit && compinit' >> $HOME/.zshrc

# install zsh plugin autoenv
git clone git://github.com/inishchith/autoenv.git $HOME/.autoenv && echo 'source ~/.autoenv/activate.sh' >> $HOME/.zshrc

# install zsh plugin asdf
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf

# configure zsh
sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search zsh-completions zsh-interactive-cd asdf tmux z urltools extract encode64 autoenv common-aliases themes)/' $HOME/.zshrc

# install tmux
cd && git clone https://github.com/gpakosz/.tmux.git \
  && ln -s -f .tmux/.tmux.conf \
  && cp .tmux/.tmux.conf.local .

# configure tmux
sed -i -e "s|^#set -g @plugin 'tmux-plugins/tmux-resurrect'|set -g @plugin 'tmux-plugins/tmux-resurrect'|" \
  -e "s|^#set -g @plugin 'tmux-plugins/tmux-continuum'|set -g @plugin 'tmux-plugins/tmux-continuum'|" \
  -e "s|^#set -g @continuum-restore 'on'|set -g @continuum-restore 'on'|" $HOME/.tmux.conf.local
sed -i -e 's|^tmux_conf_theme_left_separator_main|# tmux_conf_theme_left_separator_main|' \
  -e 's|^tmux_conf_theme_left_separator_sub|# tmux_conf_theme_left_separator_sub|' \
  -e 's|^tmux_conf_theme_right_separator_main|# tmux_conf_theme_right_separator_main|' \
  -e 's|^tmux_conf_theme_right_separator_sub|# tmux_conf_theme_right_separator_sub|' $HOME/.tmux.conf.local
sed -i -e 's|^#tmux_conf_theme_left_separator_main|tmux_conf_theme_left_separator_main|' \
  -e 's|^#tmux_conf_theme_left_separator_sub|tmux_conf_theme_left_separator_sub|' \
  -e 's|^#tmux_conf_theme_right_separator_main|tmux_conf_theme_right_separator_main|' \
  -e 's|^#tmux_conf_theme_right_separator_sub|tmux_conf_theme_right_separator_sub|' $HOME/.tmux.conf.local
