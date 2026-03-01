{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  programs.xwayland.enable = true;
  programs.hyprland.enable = true;
}
