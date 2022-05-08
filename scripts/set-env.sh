#!/bin/bash

# System
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
sudo apt install $(awk '{print $1}' ../programs/apt.list)

# Progress bar
cd /tmp
wget http://ftp.gnu.org/gnu/coreutils/coreutils-9.0.tar.xz
tar xvJf coreutils-9.0.tar.xz
cd coreutils-9.0/
wget https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.9-9.0.patch
patch -p1 -i advcpmv-0.9-9.0.patch
./configure
make
mv ./src/cp ~/.local/bin/cpg
mv ./src/mv ~/.local/bin/mvg
mv ./src/rm ~/.local/bin/rmg

#NNN
cd /tmp
wget https://github.com/jarun/nnn/archive/refs/tags/v4.4.tar.gz
cd nnn-4.4
make O_NERD=1
mv nnn ~/.local/bin

#Glow
cd /tmp
wget https://github.com/charmbracelet/glow/releases/download/v1.4.1/glow_1.4.1_linux_amd64.deb
dpkg -i glow_1.4.1_linux_amd64.deb

#nsxiv
cd /tmp
git clone https://github.com/nsxiv/nsxiv.git
cd nsxiv
git checkout v28
make
mv nsxiv ~/.local/bin

#latexindent
cd /tmp
git clone https://github.com/cmhughes/latexindent.pl
cd latexindent.pl
perl Makefile.PL
sudo make install
cd ~


#dragon
cd /tmp
git clone https://github.com/mwh/dragon.git
cd dragon
make
mv dragon ~/.local/bin
cd ~

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
cd ~
wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Mamba
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
bash Mambaforge-$(uname)-$(uname -m).sh
