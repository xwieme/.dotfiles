{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support.
  services.libinput.enable = true;
}
