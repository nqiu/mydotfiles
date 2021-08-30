
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew-installed packages
brew install ack bash cheat cloc gh git-extras global graphviz hping helm htop jq yq mdcat neovim ripgrep telnet pulumi the_silver_searcher tig tmux tree universal-ctags vim wget git vim emacs
brew install --cask wireshark burp-suit sublime-text firefox youdaodict tencent-lemon qq wechat switchhosts qqmusic yinxiangbiji iterm2 postman visual-studio-code google-chrome docker


# install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf

# install fonts-powerline
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd ..

# install ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME:-~/.oh-my-zsh}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME:~/.oh-my-zsh}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${HOME:~/.oh-my-zsh}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions ${HOME:~/.oh-my-zsh}/plugins/zsh-completions
echo 'autoload -U compinit && compinit' >> $HOME/.zshrc

# install zsh plugin autoenv
git clone git://github.com/inishchith/autoenv.git $HOME/.autoenv && echo 'source ~/.autoenv/activate.sh' >> $HOME/.zshrc

# install zsh plugin asdf
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf

# configure zsh
sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search zsh-completions zsh-interactive-cd asdf tmux z urltools extract encode64 autoenv common-aliases themes)/' $HOME/.zshrc

# install tmux
cd && git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf  && cp .tmux/.tmux.conf.local .

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

# install spacevim ofr neovim
curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim
nvim +SPInstall +qa
cat <<EOF > ~/.SpaceVim.d/init.toml

[[layers]]
name = 'lang#go'

[[layers]]
name = 'git'

[[layers]]
name = 'lang#markdown'

[[layers]]
name = 'lang#python'

[[layers]]
name = 'debug'

[[layers]]
name = 'tools'

[[layers]]
name = 'gtags'
gtagslabel = 'pygments'

[[layers]]
name = 'lang#c'
EOF
nvim +SPInstall +qa

# install spf13-vim for vim
sh <(curl https://j.mp/spf13-vim3 -L)
vim +BundleInstall! +qa
cp .vimrc.bundles.local .vimrc.local .vimrc.before.local ~/

