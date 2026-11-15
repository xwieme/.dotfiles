{ config, ... }: {
  services.hyprpaper.settings = {
    preload = [ "${config.home.homeDirectory}/.dotfiles/wallpaper.jpg" ];
    wallpaper = [
      {
        monitor = "";
        path = "${config.home.homeDirectory}/.dotfiles/wallpaper.jpg";
      }
    ];
  };
}
