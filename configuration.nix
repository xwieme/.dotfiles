# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;  
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xkb.layout = "us";
  };

  programs.xwayland.enable = true;
  programs.hyprland.enable = true;

  virtualisation.docker.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  nix.gc.automatic = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xander = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim 
    wget
    firefox
    waybar
    kitty
    tmux
    rofi-wayland
    yazi
    lazygit
    starship
    git
    stow
    gnugrep
    gcc
    gnumake
    discord
    spotify
    python314
    brightnessctl
    pamixer
    mako
    libnotify
    neofetch
    nodejs_22
    swaybg
    swaylock-effects
    trash-cli
    cachix
  ];

  programs.tmux = {
      enable = true;
      shortcut = "Space";
      baseIndex = 1;
      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.catppuccin
        tmuxPlugins.yank
      ];
      extraConfig = ''
        set-option -sa terminal-overrides ",xterm*:Tc"
        set -g mouse on
        bind C-l send-keys 'C-l' # Clear screen
      '';
  };

  system.stateVersion = "24.11"; # Did you read the comment?

}

