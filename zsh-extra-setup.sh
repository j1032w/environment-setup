
#	o my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


#	bash auto complete
autoload -U compinit
compinit
zstyle ':completion:*' menu select


section "Installing fzf ..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
