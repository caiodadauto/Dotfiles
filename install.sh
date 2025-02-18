#!/bin/bash

function br {
	for ((i=1; i<=`tput cols`; i++)); do echo -n -; done
}

function cont {
	read -r -p "[SUCCESS] Continue to next step? [Y/n] " continue
	case $continue in
		[nN])
			exit
			;;
		*)
			;;
	esac
}

function create_conf_dirs {
	br
	read -r -p "Should conf dirs be created? [Y/n] " res
	case "$res" in
		[yY])
            mkdir -p ~/.config
            mkdir -p ~/.local/bin
            mkdir -p ~/.local/share/zsh
            mkdir -p ~/.local/share/fonts
            mkdir -p ~/.local/share/catppuccin
			;;
		*)
			;;
	esac
	cont
}

function set_configs {
	br
	read -r -p "Should config files be set? [Y/n] " res
	case "$res" in
		[yY])
            stow ./zsh
            stow ./btop
            stow ./nvim
            stow ./tmux
            stow ./stylua
            stow ./sheldon
            stow ./starship
            stow ./latexindent
            stow ./alacritty
			;;
		*)
			;;
	esac
	cont
}

function set_zsh {
	br
	read -r -p "Should ZSH be set as default? [Y/n] " res
	case "$res" in
		[yY])
            chsh -s /bin/zsh
			;;
		*)
			;;
	esac
	cont
}

function set_aux_colors {
	br
	read -r -p "Should colors for zsh, bat, and btop be set? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            git clone https://github.com/catppuccin/bat.git
            git clone https://github.com/catppuccin/btop.git
            git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
            mkdir -p ~/.config/btop
            mkdir -p ~/.config/bat/themes
            cp -r btop/themes/ ~/.config/btop
            cp bat/*.tmTheme ~/.config/bat/themes
            cp -v zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.local/share/catppuccin
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function set_security {
	br
	read -r -p "Should security be set? [Y/n] " res
	case "$res" in
		[yY])
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
			;;
		*)
			;;
	esac
	cont
}

function gmk67_workaround {
	br
	read -r -p "Should GMK67 workaround be done? [Y/n] " res
	case "$res" in
		[yY])
            # Workaround for GMK67
            # https://unix.stackexchange.com/questions/604791/keyboard-function-keys-always-trigger-media-shortcuts-regardless-of-whether-fn
            # https://www.reddit.com/r/Varmilo/comments/we5d1v/varmilo_on_linux_do_they_work_well_now/
            sudo echo "options hid_apple fnmode=2" > /etc/modprobe.d/hid_apple.conf
			;;
		*)
			;;
	esac
	cont
}

function install_pkg {
	br
	read -r -p "Should system packages be installed? [Y/n] " res
	case "$res" in
		[yY])
            sudo apt install $(awk '{print $1}' ./pkglists/apt.list)
            # sudo pacman -Syu $(awk '{print $1}' ./pkglists/pacman.list)
			;;
		*)
			;;
	esac
	cont
}

function install_fonts {
	br
	read -r -p "Should fonts be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Iosevka.zip
            wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/IosevkaTerm.zip
            unzip Iosevka.zip
            unzip IosevkaTerm.zip
            cp *.ttf ~/.local/share/fonts
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function install_sioyek {
	br
	read -r -p "Should Sioyek be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            wget https://github.com/ahrm/sioyek/releases/download/v2.0.0/sioyek-release-linux.zip
            unzip sioyek-release-linux.zip
            mv Sioyek-x86_64.AppImage ~/.local/bin/sioyek
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function install_tpm {
	br
	read -r -p "Should tpm be installed? [Y/n] " res
	case "$res" in
		[yY])
            git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
			;;
		*)
			;;
	esac
	cont
}

function install_nnn {
	br
	read -r -p "Should nnn be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            wget https://github.com/jarun/nnn/archive/refs/tags/v5.0.tar.gz
            tar xzf v5.0.tar.gz
            cd nnn-5.0
            make O_NERD=1 O_GITSTATUS=1
            mv nnn ~/.local/bin
            sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function install_chafa {
	br
	read -r -p "Should chafa be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            git clone https://github.com/hpjansson/chafa.git
            cd chafa
            git checkout 1.12.5
            ./autogen.sh
            make
            mv tools/chafa/chafa ~/.local/bin
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function install_dragon {
	br
	read -r -p "Should dragon be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            git clone https://github.com/mwh/dragon.git
            cd dragon
            git checkout v1.2.0
            make
            mv dragon ~/.local/bin
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function install_fzf {
	br
	read -r -p "Should fzf be installed? [Y/n] " res
	case "$res" in
		[yY])
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            ~/.fzf/install
			;;
		*)
			;;
	esac
	cont
}

function install_rust {
	br
	read -r -p "Should rust be installed? [Y/n] " res
	case "$res" in
		[yY])
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
            cd ~/.cargo/bin
            ./cargo install $(awk '{print $1}' $HOME/Dotfiles/pkglists/cargo.list)
			;;
		*)
			;;
	esac
	cont
}

function install_starship {
	br
	read -r -p "Should starship be installed? [Y/n] " res
	case "$res" in
		[yY])
            sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b ~/.local/bin
			;;
		*)
			;;
	esac
	cont
}

function install_luarocks {
	br
	read -r -p "Should luarocks be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
            tar zxpf luarocks-3.11.1.tar.gz
            cd luarocks-3.11.1
            ./configure && make && sudo make install
			;;
		*)
			;;
	esac
	cont
}

function install_neovim {
	br
	read -r -p "Should neovim be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
            chmod +x nvim.appimage
            sudo mv nvim.appimage /usr/local/bin/nvim
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function install_mamba {
	br
	read -r -p "Should mamba be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
            bash Mambaforge-$(uname)-$(uname -m).sh
            cd ~/.mambaforge/bin/
            ./conda config --set auto_activate_base false
            ./conda config --set changeps1 False
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function install_nvm {
    # FIXME: Setup the CONFIG dir before nvm install
	br
	read -r -p "Should node be installed? [Y/n] " res
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
}

function install_alacritty {
	br
	read -r -p "Should alacritty be installed? [Y/n] " res
	case "$res" in
		[yY])
            cd /tmp
            git clone https://github.com/alacritty/alacritty.git
            cd alacritty
            git checkout v0.15.1
            ln -s $HOME/.cargo/bin/cargo .
            ./cargo build --release
            sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
            sudo cp target/release/alacritty /usr/local/bin
            sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
            sudo desktop-file-install extra/linux/Alacritty.desktop
            sudo update-desktop-database
            unlink cargo
            cd ~
			;;
		*)
			;;
	esac
	cont
}

function set_py_envs {
	br
	read -r -p "Should Python env be set? [Y/n] " res
	case "$res" in
		[yY])
            __conda_setup="$('~/.mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
            if [ $? -eq 0 ]; then
                eval "$__conda_setup"
            else
                if [ -f "~/.mambaforge/etc/profile.d/conda.sh" ]; then
                    . "~/.mambaforge/etc/profile.d/conda.sh"
                else
                    export PATH="~/.mambaforge/bin:$PATH"
                fi
            fi
            unset __conda_setup

            if [ -f "~/.mambaforge/etc/profile.d/mamba.sh" ]; then
                . "~/.mambaforge/etc/profile.d/mamba.sh"
            fi
            mamba create -n utils python=3.10
            mamba activate utils
            mamba install pynvim
            mamba deactivate
			;;
		*)
			;;
	esac
	cont
}

# create_conf_dirs
# install_pkg
# install_fonts
# install_luarocks
# install_neovim
# install_nvm
install_rust
install_alacritty
install_sioyek
install_tpm
install_chafa
install_dragon
install_fzf
install_starship
install_mamba
set_aux_colors
set_zsh
install_nnn
set_py_envs
# set_configs
# gmk67_workaround

echo "Installation was DONE, reboot and"
echo "=> [TMUX] Install the plugins doing Prefix + I in a tmux section"
echo "=> [NODE] Install all packages in node.list"
echo "=> [NNN] Change zathura by sioyek in function handle_pdf() into plugin Nuke"
echo "=> [GMK67 Workaround] sudo echo "options hid_apple fnmode=2" > /etc/modprobe.d/hid_apple.conf"
