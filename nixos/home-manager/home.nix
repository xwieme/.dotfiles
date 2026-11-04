{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./nvim.nix ./ghostty.nix ./hyprland.nix];

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
  };

  home.packages = with pkgs; [vlc];
}
