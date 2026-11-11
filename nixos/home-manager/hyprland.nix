{lib, ...}: let 

  call = list: { _args = list; };
  bind = bind_args:
    call (lib.imap0
        (i: x: if i == 1 then lib.generators.mkLuaInline x else x)
    bind_args);
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
in
{
  wayland.windowManager.hyprland.settings = {
    config = {
      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 1;
        layout = "dwindle";
      };
      decoration.rounding = 5;
    };

    bind = map bind (builtins.concatLists [
      [
        ["SUPER + Q" "hl.dsp.window.close()"]
        ["SUPER + O" "hl.dsp.exit()"]
        ["SUPER + CTRL + L"  (exec "swaylock")]
        ["SUPER + F" "hl.dsp.window.fullscreen()"]

        # # Audio
        # ["SUPER + M" (exec  "pamixer -i 5 && notify-send -t 500 $(pamixer --get-volume-human)")] # Increase volume by 5% and send notification of volume level
        # ["XF86AudioRaiseVolume" (exec "pamixer -i 5  && notify-send -t 500 $(pamixer --get-volume-human)")] # Increase volume by 5%
        # ["SUPER + N" (exec "pamixer -d 5 && notify-send -t 500 $(pamixer --get-volume-human)")] # Decrease volume by 5%
        # ["XF86AudioLowerVolume" (exec pamixer -d 5 && notify-send -t 500 $(pamixer --get-volume-human)")] # Decrease volume by 5%
        # ["XF86AudioMute (exec "pamixer --toggle-mute && notify-send -t 500 $(pamixer --get-volume-human)")]

        # Brightness control
        ["XF86MonBrightnessUp" (exec "brightnessctl set 5%+")]
        ["XF86MonBrightnessDown" (exec "brightnessctl set 5%-")]

        # Move focus
        ["SUPER + H" ''hl.dsp.focus({ direction = "l" })'']
        ["SUPER + L" ''hl.dsp.focus({ direction = "r" })'']
        ["SUPER + K" ''hl.dsp.focus({ direction = "u" })'']
        ["SUPER + J" ''hl.dsp.focus({ direction = "d" })'']

        # Move windows
        ["SUPER + SHIFT + H"  ''hl.dsp.window.swap({ direction = "l" })'']
        ["SUPER + SHIFT + L"  ''hl.dsp.window.swap({ direction = "r" })'']
        ["SUPER + SHIFT + K"  ''hl.dsp.window.swap({ direction = "u" })'']
        ["SUPER + SHIFT + J"  ''hl.dsp.window.swap({ direction = "d" })'']

        ["SUPER + return" (exec "foot")]
        ["SUPER + space" (exec "killall rofi || rofi -show drun")]
      ]

      (builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              ["SUPER + code:1${toString i}" ''hl.dsp.focus({ workspace = "${toString ws}" })'']
              ["SUPER + SHIFT + code:1${toString i}" ''hl.dsp.window.move({ workspace = "${toString ws}" })'']
            ]
          )
          9)
      )
    ]);
  };
}
