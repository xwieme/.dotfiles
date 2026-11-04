{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    config = {
      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 1;
        layout = "dwindle";
      };
      decoration.rounding = 5;
    };

    bind =
      [
        "$mod, Q, killactive,"
        "$mod, O, exit,"
        "$mod CTRL, L, exec, swaylock"
        "$mod, F, fullscreen, 1"

        # Audio
        "$mod, M, exec, pamixer -i 5 && notify-send -t 500 $(pamixer --get-volume-human)" # Increase volume by 5% and send notification of volume level
        ", XF86AudioRaiseVolume, exec, pamixer -i 5  && notify-send -t 500 $(pamixer --get-volume-human)" # Increase volume by 5%
        "$mod, N, exec, pamixer -d 5 && notify-send -t 500 $(pamixer --get-volume-human)" # Decrease volume by 5%
        ", XF86AudioLowerVolume, exec, pamixer -d 5 && notify-send -t 500 $(pamixer --get-volume-human)" # Decrease volume by 5%
        " , XF86AudioMute, exec, pamixer --toggle-mute && notify-send -t 500 $(pamixer --get-volume-human)"

        # Brightness control
        ", XF86MonBrightnessUp,     exec, brightnessctl set 5%+"
        " , XF86MonBrightnessDown,   exec, brightnessctl set 5%-"

        # Move focus
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        # Move windows
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        "$mod, return, exec, ghostty"
        "$mod, space, exec, killall rofi || rofi -show drun"
      ]
      ++ (
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };
}
