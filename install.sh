#!/usr/bin/bash

# Install packages
# sudo pacman -Syyu hyprland \
# 	kitty \
# 	mako \
# 	picom \
# 	rofi \
# 	swaybg \
# 	swaylock \
# 	tmux \
# 	waybar \
# 	yazi \
# 	starship \
# 	nix \
# 	pamixer \
# 	discord \
# 	spotify-launcher \
# 	ttf-nerd-fonts-symbols \
# 	ttf-fira-code \
# 	pipewire \
# 	wireplumber \
# 	qt5-wayland \
# 	qt6-wayland \
# 	noto-fonts \
# 	firefox \
# 	chromium \
# 	thunderbird \
#  	lazygit \
# 	brightnessctl \
# 	libnotify \
# 	trash-cli \
# 	ripgrep \
# 	perl-file-homedir \
# 	perl-yaml-tiny \
# 	gcc \
# 	make

# Install dotfiles
cp -r hypr $HOME/.config/
cp -r kitty $HOME/.config/
cp -r mako $HOME/.config/
cp -r nvim $HOME/.config/
cp -r picom $HOME/.config/
cp -r rofi $HOME/.config/
cp -r swaylock $HOME/.config/
cp -r tmux $HOME/.config/
cp -r waybar $HOME/.config/
cp -r yazi $HOME/.config/
cp -r starship.toml $HOME/.config/
cp -r --remove-destination .bashrc $HOME
