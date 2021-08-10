#!/bin/zsh

# System
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
sudo pacman -Syu $(awk '{print $1}' ../programs/apt.list) -y

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cd $HOME/.cargo/bin
./cargo install $(awk '{print $1}' $HOME/Dotfiles/programs/cargo.list)

# Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b $HOME/.local/bin

# Neovim
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Pyenv
curl https://pyenv.run | bash
cd $HOME/.pyenv/bin
./pyenv install 3.8.5
./pyenv global 3.8.5
./pyenv virtualenv 3.8.5 phd
./pyenv virtualenv 3.8.5 fin
