# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./core/boot.nix
    ./core/networking.nix
    ./core/display.nix
    ./optional/users.nix
    ./optional/services.nix
    ./optional/programs.nix
  ];

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  virtualisation.docker.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      trusted-substituters = [
        "http://cache.nixos.org"
      ];

      substituters = [
        "http://cache.nixos.org"
      ];
    };
    gc.automatic = false;
  };
}
