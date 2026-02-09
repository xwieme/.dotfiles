{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xander = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
  };
}
