{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.enable = true;
  fonts.fontconfig.enable = true;

  catppuccin.autoEnable = true;
  catppuccin.enable = true;
  catppuccin.flavor = "mocha";
  catppuccin.accent = "teal";

  imports = [
    ./hyprland.nix
    ./programs/nvim.nix
    ./programs/foot.nix
    ./programs/tmux.nix
    ./programs/waybar.nix
    ./services/mako.nix
    ./services/hyprpaper.nix
  ];

  home = {
    username = "xander";
    homeDirectory = "/home/xander";
    stateVersion = "26.05";
  };

  programs = {
    home-manager.enable = true;
    zsh.enable = true;
    neovim.enable = true;
    git.enable = true;
    tmux.enable = true;
    # obsidian.enable = true;
    # thunderbird.enable = true;
    foot.enable = true;
    firefox.enable = true;
    lazygit.enable = true;
    hyprlock.enable = true;
    waybar.enable = true;
    ranger.enable = true;
    # rofi.enable = true;
  };

  services = {
    hyprpaper.enable = true;
    mako.enable = true;
    hyprlauncher.enable = true;
    hyprpolkitagent.enable = true;
  };

  home.packages = with pkgs; [
    vlc
    ctags
    wl-clipboard
    nerd-fonts.fira-code
    fd
    tree-sitter
    nixfmt
  ];
}
