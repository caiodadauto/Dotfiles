#!/bin/bash

#System
printf "\n\n=====================SYSTEM=====================\n"
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/zsh
sudo apt install $(awk '{print $1}' ../programs/apt.list)

#Node
printf "\n\n=====================Node=====================\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

#Node
printf "\n\n=====================TMUX=====================\n"
tmux
tmux source-file ~/.config/tmux/tmux.conf 
sudo cp ~/.config/systemd/user/tmux.service /etc/systemd/system/
sudo systemctl enable tmux --now

#NNN
printf "\n\n=====================NNN=====================\n"
cd /tmp
wget https://github.com/jarun/nnn/archive/refs/tags/v4.4.tar.gz
tar xzf v4.4.tar.gz
cd nnn-4.4
make O_NERD=1
mv nnn ~/.local/bin
cd ~

#nsxiv
printf "\n\n=====================NSXIV=====================\n"
cd /tmp
git clone https://github.com/nsxiv/nsxiv.git
cd nsxiv
git checkout v30
make
mv nsxiv ~/.local/bin
cd ~

#latexindent
printf "\n\n=====================LATEXINDENT=====================\n"
cd /tmp
git clone https://github.com/cmhughes/latexindent.pl
cd latexindent.pl
perl Makefile.PL
sudo make install
cd ~

#dragon
printf "\n\n=====================DRAGON=====================\n"
cd /tmp
git clone https://github.com/mwh/dragon.git
cd dragon
git checkout v1.2.0
make
mv dragon ~/.local/bin
cd ~

# FZF
printf "\n\n=====================FZF=====================\n"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Rust
printf "\n\n=====================RUST=====================\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
./$HOME/.cargo/bin/cargo install $(awk '{print $1}' $HOME/Dotfiles/programs/cargo.list)
cd /tmp
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
git checkout 13.0.0
cargo build --features 'pcre2'
mv target/debug/rg ~/.local/bin


# Starship
printf "\n\n=====================STARSHIP=====================\n"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b $HOME/.local/bin

# Neovim
printf "\n\n=====================NEOVIM=====================\n"
cd ~
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Mamba
printf "\n\n=====================MAMBAFORGE=====================\n"
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
bash Mambaforge-$(uname)-$(uname -m).sh
rm Mambaforge-$(uname)-$(uname -m).sh
cd ~/.mambaforge/bin/
./conda config --set auto_activate_base false
cd ~
