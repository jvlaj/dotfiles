#!/bin/bash

## packages

pac_PKGS = "xorg-server nvidia zsh spectrwm yay keepassxc curl redshift nodejs npm git python3 python2 python-pip python2-pip zathura zathura-cb zathura-djvu zathura-pdf-poppler ranger dunst spotifyd rofi dmenu uxterm chromium qutebrowser neovim xset feh fcitx-mozc fcitx-configtool pacman-contrib pass gnupg"
aur_PKGS = "spotify-tui nerd-fonts-sf-mono nerd-fonts-iosevka"
npm_PKGS = "neovim"
pip_PKGS = "jedi flake8 neovim"

## setup dotfiles

mkdir -p $HOME/repos/dotfiles
git clone --bare https://github.com/jvlaj/dotfiles.git $HOME/repos/dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/repos/dotfiles --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
dots checkout -f

## install theme

git clone https://github.com/rayes0/sayo.git $HOME/repos/
mkdir -p $HOME/.themes/
cp -r $HOME/repos/sayo-dark $HOME/.themes/

## install packages

sudo pacman -S -y "${pac_PKGS[@]}"

git clone https://aur.archlinux.org/yay.git 
cd yay
if [ makepkg -sri --noconfirm --needed ]; then
	yay -S -y "${aur_PKGS[@]}"
fi

sudo npm install "${npm_PKGS[@]}"

sudo pip install "${pip_PKGS[@]}"

echo
echo "Installation completed."
