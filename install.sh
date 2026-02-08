#!/usr/bin/bash

# Install dotfiles
ln -s $PWD/hypr $HOME/.config/
ln -s $PWD/ghostty $HOME/.config/
ln -s $PWD/mako $HOME/.config/
ln -s $PWD/rofi $HOME/.config/
ln -s $PWD/swaylock $HOME/.config/
ln -s $PWD/tmux $HOME/.config/
ln -s $PWD/waybar $HOME/.config/
ln -s $PWD/yazi $HOME/.config/
ln -s $PWD/starship.toml $HOME/.config/
# ln -s --force .bashrc $HOME

# Install cursor theme
tar -xvf Bibata-Modern-Ice.tar.xz
hyprcursor-util --extract Bibata-Modern-Ice
sed -i 's/Extracted Theme/Bibata-Modern-Ice/' extracted_Bibata-Modern-Ice/manifest.hl
hyprcursor-util --create extracted_Bibata-Modern-Ice
rm -rf Bibata-Modern-Ice extracted_Bibata-Modern-Ice
mv theme_Bibata-Modern-Ice Bibata-Modern-Ice
mv Bibata-Modern-Ice $HOME/.local/share/icons
hyprctl setcursor Bibata-Modern-Ice 24
