#!/bin/sh

# System
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/zsh
sudo pacman install $(awk '{print $1}' ../programs/pacman.list) -y
sudo npm i -g pyright

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cd $HOME/.cargo/bin
./cargo install $(awk '{print $1}' $HOME/Dotfiles/programs/cargo.list)

# Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Neovim
cd ~
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Miniconda

# Pyenv
curl https://pyenv.run | bash
cd $HOME/.pyenv/bin
./pyenv install 3.8.9
./pyenv global 3.8.9
./pyenv virtualenv 3.8.9 ml

# ZSH
echo -e '\nexec zsh' >> $HOME/.bashrc
