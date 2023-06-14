#!/bin/bash

printf "\n\n=====================SYSTEM=====================\n"
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/zsh
mkdir -p ~/.local/share/catppuccin
sudo apt install $(awk '{print $1}' ../programs/apt.list)
chsh -s /bin/zsh
# Work arround for GMK67
# https://unix.stackexchange.com/questions/604791/keyboard-function-keys-always-trigger-media-shortcuts-regardless-of-whether-fn
# https://www.reddit.com/r/Varmilo/comments/we5d1v/varmilo_on_linux_do_they_work_well_now/
sudo echo "options hid_apple fnmode=2" > /etc/modprobe.d/hid_apple.conf

printf "\n\n=====================Colors=====================\n"
cd /tmp
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
cd zsh-syntax-highlighting/themes/
cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.local/share/catppuccin

cd /tmp
git clone https://github.com/catppuccin/btop.git
mkdir -p ~/.config/btop
cp -r btop/themes/ ~/.config/btop

git clone https://github.com/catppuccin/bat.git
mkdir -p "$(bat --config-dir)/themes"
cp bat/*.tmTheme "$(bat --config-dir)/themes"

printf "\n\n=====================Sioyek=====================\n"
cd /tmp
wget https://github.com/ahrm/sioyek/releases/download/v2.0.0/sioyek-release-linux.zip
unzip sioyek-release-linux.zip
mv Sioyek-x86_64.AppImage ~/.local/bin/sioyek

printf "\n\n=====================TMUX=====================\n"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux source-file ~/.config/tmux/tmux.conf
sudo cp ~/.config/systemd/user/tmux.service /etc/systemd/system/
sudo systemctl enable tmux --now

printf "\n\n=====================NNN=====================\n"
cd /tmp
wget https://github.com/jarun/nnn/archive/refs/tags/v4.8.tar.gz
tar xzf v4.8.tar.gz
cd nnn-4.8
make O_NERD=1 O_GITSTATUS=1
mv nnn ~/.local/bin
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
printf "Change zathura by sioyek in function handle_pdf() into plugin Nuke"
cd ~

printf "\n\n=====================CHAFA=====================\n"
cd /tmp
git clone https://github.com/hpjansson/chafa.git
cd chafa
git checkout 1.12.5
./autogen.sh
make
mv tools/chafa/chafa ~/.local/bin
cd ~

printf "\n\n=====================DRAGON=====================\n"
cd /tmp
git clone https://github.com/mwh/dragon.git
cd dragon
git checkout v1.2.0
make
mv dragon ~/.local/bin
cd ~

printf "\n\n=====================FZF=====================\n"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

printf "\n\n=====================RUST=====================\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
./$HOME/.cargo/bin/cargo install $(awk '{print $1}' $HOME/Dotfiles/programs/cargo.list)
# cd /tmp
# git clone https://github.com/BurntSushi/ripgrep
# cd ripgrep
# git checkout 13.0.0
# cargo build --features 'pcre2'
# mv target/debug/rg ~/.local/bin

printf "\n\n=====================STARSHIP=====================\n"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b $HOME/.local/bin

printf "\n\n=====================NEOVIM=====================\n"
cd ~
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
git clone https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

printf "\n\n=====================MAMBAFORGE=====================\n"
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
bash Mambaforge-$(uname)-$(uname -m).sh
rm Mambaforge-$(uname)-$(uname -m).sh
cd ~/.mambaforge/bin/
./conda config --set auto_activate_base false
cd ~

printf "\n\n=====================Security=====================\n"
sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw enable 

sudo systemctl enable fail2ban.service
sudo systemctl start fail2ban.service
sudo fail2ban-client start

sudo systemctl enable clamav-freshclam.service
sudo systemctl start clamav-freshclam.service

sudo systemctl enable privoxy.service
sudo systemctl start privoxy.service
