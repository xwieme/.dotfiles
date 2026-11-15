{ pkgs, ... }: {
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
    # Window Manager
    hyprcursor
    hyprpaper
    libnotify
    mako
    trash-cli
    brightnessctl
    pamixer
    # Apps
    pavucontrol
    clamav
  ];

  programs = {
    waybar.enable = true;
    foot.enable = true;
    neovim.enable = true;
    starship.enable = true;
  };

  # services = {
  #   pulseaudio.enable = true;
  # };

}
