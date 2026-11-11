{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    displayManager.ly.enable = true;
  };

  programs.xwayland.enable = true;
  programs.hyprland.enable = true;
  xdg.portal.enable = true;
}
