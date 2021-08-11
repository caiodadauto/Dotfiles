#!/bin/zsh

# System
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
sudo pacman -Syu $(awk '{print $1}' ../programs/pacman.list)

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

# Install Miniconda
cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
chmod +x Miniconda3-py38_4.10.3-Linux-x86_64.sh
./Miniconda3-py38_4.10.3-Linux-x86_64.sh
$HOME/.miniconda3/bin/conda create --name phd python=3.8.5
$HOME/.miniconda3/bin/conda create --name fin python=3.8.5
$HOME/.miniconda3/bin/conda config --set changeps1 False

