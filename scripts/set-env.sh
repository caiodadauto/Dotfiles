#!/bin/sh

# System
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/zsh
echo -e '\ndeb http://deb.debian.org/debian buster main' | sudo tee -a /etc/apt/sources.list.d/stable.list
echo -e 'deb-src http://deb.debian.org/debian buster main\n' | sudo tee -a /etc/apt/sources.list.d/stable.list
echo -e 'deb http://deb.debian.org/debian-security/ buster/updates main' | sudo tee -a /etc/apt/sources.list.d/stable.list
echo -e 'deb-src http://deb.debian.org/debian-security/ buster/updates main\n' | sudo tee -a /etc/apt/sources.list.d/stable.list
echo -e 'deb http://deb.debian.org/debian buster-updates main' | sudo tee -a /etc/apt/sources.list.d/stable.list
echo -e 'deb-src http://deb.debian.org/debian buster-updates main\n' | sudo tee -a /etc/apt/sources.list.d/stable.list
sudo pacman install $(awk '{print $1}' ../programs/apt.list) -y
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

# Profile
echo -e '\nexport XDG_CONFIG_HOME=$HOME/.config' >> $HOME/.bashrc
echo -e '\nexport XDG_CACHE_HOME=$HOME/.cache' >> $HOME/.bashrc
echo -e '\nexport XDG_DATA_HOME=$HOME/.local/share' >> $HOME/.bashrc
echo -e '\nexport export EDITOR="nvim"' >> $HOME/.bashrc
echo -e '\nexport TERMINAL="alacritty"' >> $HOME/.bashrc
echo -e '\nexport ZDOTDIR=$HOME/.config/zsh' >> $HOME/.bashrc
echo -e '\nexec zsh' >> $HOME/.bashrc
