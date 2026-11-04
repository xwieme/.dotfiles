{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support.
  services.libinput.enable = true;

  services.clamav = {
    daemon.enable = true;
    scanner.enable = true;
    updater.enable = true;
  };
}
