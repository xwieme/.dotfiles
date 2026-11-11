{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # CLI apps
    wget
    gcc
    gnugrep
    ripgrep
    gnumake
    cachix
    neovim
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
    foot
    # rofi
    pavucontrol
    pulseaudio
    clamav
  ];
}
