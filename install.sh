#!/usr/bin/bash

# # Install packages
# sudo pacman -Syyu --needed \
#     hyprland \
#     hyprpaper \
# 	kitty \
# 	mako \
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
# 	make \
#     bluez \
#     bluez-utils \
#     pavucontrol \
#     pulseaudio \
#     pulseaudio-bluetooth \
#     vlc-plugin-pulse \
#     vlc \
#     xcur2png
#
#
# # Install dotfiles
# cp -r hypr $HOME/.config/
# cp -r kitty $HOME/.config/
# cp -r mako $HOME/.config/
# cp -r nvim $HOME/.config/
# cp -r rofi $HOME/.config/
# cp -r swaylock $HOME/.config/
# cp -r tmux $HOME/.config/
# cp -r waybar $HOME/.config/
# cp -r yazi $HOME/.config/
# cp -r starship.toml $HOME/.config/
# cp -r --remove-destination .bashrc $HOME

# Install cursor theme
tar -xvf Bibata-Modern-Ice.tar.xz
hyprcursor-util --extract Bibata-Modern-Ice
sed -i 's/Extracted Theme/Bibata-Modern-Ice/' extracted_Bibata-Modern-Ice/manifest.hl
hyprcursor-util --create extracted_Bibata-Modern-Ice
rm -rf Bibata-Modern-Ice extracted_Bibata-Modern-Ice
mv theme_Bibata-Modern-Ice Bibata-Modern-Ice
mv Bibata-Modern-Ice $HOME/.local/share/icons
hyprctl setcursor Bibata-Modern-Ice 24
