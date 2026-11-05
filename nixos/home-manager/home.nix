{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./programs/nvim.nix
    ./programs/ghostty.nix
    ./programs/rofi.nix
    ./programs/swaylock.nix
    ./services/mako.nix
    ./services/hyprpaper.nix
  ];

  home = {
    username = "xander";
    homeDirectory = "/home/xander";
  };

  programs = {
    home-manager.enable = true;
    neovim.enable = true;
    git.enable = true;
    tmux.enable = true;
    obsidian.enable = true;
    thunderbird.enable = true;
    ghostty.enable = true;
    firefox.enable = true;
    lazygit.enable = true;
    swaylock.enable = true;
    rofi.enable = true;
  };

  services = {
    hyprpaper.enable = true;
    mako.enable = true;
  };

  wayland.windowManager.hyprland.enable = true;

  home.packages = with pkgs; [vlc ctags];
}
