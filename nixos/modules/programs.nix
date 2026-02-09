{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # CLI apps
    wget
    gcc
    git
    lazygit
    gnugrep
    ripgrep
    gnumake
    cachix
    tmux
    yazi
    htop
    tree
    xcur2png
    # Window Manager
    hyprcursor
    hyprpaper
    libnotify
    mako
    trash-cli
    starship
    brightnessctl
    pamixer
    swaybg
    swaylock-effects
    waybar
    # Apps
    neovim 
    firefox
    ghostty
    rofi
    discord
    spotify
    thunderbird
    chromium
    vlc
    pavucontrol
    pulseaudio
  ];
}
