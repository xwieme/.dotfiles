{

  programs.waybar = {
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 4;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "bluetooth"
          "network"
          "battery"
        ];

        clock = {
          format = "{:%a %d %b %H:%M }";
          format-alt = "{:%F %T}";
          interval = 1;
          tooltip = false;
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{used:0.1f}G 󰍛";
        };

        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };

        network = {
          format = "{ifname}";
          format-wifi = "   {signalStrength}%";
          format-ethernet = "󰈀  {ifname}";
          format-disconnected = "Disconnected";
          tooltip-format = "󰈀 {ifname} via {gwaddri}";
          tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
          tooltip-format-ethernet = "󰈀 {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = "  {capacity}%";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = " ";
          format-icons = {
            headphone = " ";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };

      };

    };

    style = ''
      @define-color background1 #1e1e2e;
      @define-color background2 #313244;
      @define-color textcolor1 #cdd6f4;
      @define-color textcolor2 #00ff00;
      @define-color textcolor3 #a6adc8;

      /* -----------------------------------------------------
       * General 
       * ----------------------------------------------------- */

      * {
          font-family: "FiraCode Nerd Font",  Helvetica;
          border: none;
          border-radius: 0px;
      }

      window#waybar {
          background-color: rgba(0,0,0,0.0);
          border-bottom: 0px solid #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
      }

      .modules-right {
          padding-right: 10px;
      }

      .modules-left {
          padding-left: 10px;
      }

      /* -----------------------------------------------------
       * Workspaces 
       * ----------------------------------------------------- */

      #workspaces {
          margin: 5px 1px 6px 1px;
          padding: 0px 1px;
          border-radius: 15px;
          border: 0px;
          font-weight: bold;
          font-style: normal;
          font-size: 12px;
          color: @textcolor1;
          background-color: @background1;
      }

      #workspaces button {
          padding: 0px 5px;
          margin: 4px 3px;
          border-radius: 15px;
          border: 0px;
          color: @textcolor3;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button.active {
          color: @textcolor1;
          background: @background2;
          border-radius: 15px;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button:hover {
          color: @textcolor1;
          background: @background2;
          border-radius: 15px;
      }


      /* -----------------------------------------------------
       * Tooltips
       * ----------------------------------------------------- */

      tooltip {
          border-radius: 10px;
          background-color: @background2;
          opacity:0.9;
          padding:20px;
          margin:0px;
      }

      tooltip label {
          color: @textcolor1;
      }

      /* -----------------------------------------------------
       * Window
       * ----------------------------------------------------- */

      #window {
          margin: 0px 15px 0px 0px;
          border-radius: 12px;
          color:@textcolor1;
          font-size:12px;
          font-weight:normal;
      }

      window#waybar.empty #window {
          background-color:transparent;
      }

      /* -----------------------------------------------------
       * Modules
       * ----------------------------------------------------- */

      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }


      /* -----------------------------------------------------
       * Clock
       * ----------------------------------------------------- */

      #clock {
          font-size: 12px;
          font-weight: bold;
          color: @textcolor1;
          margin: 5px 1px 6px 1px;
          padding: 6px;
          border-radius: 15px;
          border: 0px;
          background-color: @background1;
      }

      /* -----------------------------------------------------
       * Backlight
       * ----------------------------------------------------- */

       #backlight {
          font-size: 12px;
          color: @textcolor1;
          border-radius: 15px;
          margin: 0px 15px 0px 0px;
          background-color: transparent;
      }

      /* -----------------------------------------------------
       * Pulseaudio
       * ----------------------------------------------------- */

       #pulseaudio {
          font-size: 12px;
          color: @textcolor1;
          margin: 5px 1px 6px 1px;
          padding: 0px 15px;
          border: 0px;
          border-radius: 15px;
          background-color: @background1;
      }

      #pulseaudio.muted {
          color: @textcolor1;
          background-color: @background1;
      }

      /* -----------------------------------------------------
       * Network
       * ----------------------------------------------------- */

      #network {
          font-size: 12px;
          color: @textcolor1;
          margin: 5px 1px 6px 1px;
          padding: 0px 15px;
          border: 0px;
          border-radius: 15px;
          background-color: @background1;
      }

      #network.ethernet {
          color: @textcolor1;
      }

      #network.wifi {
          color: @textcolor1;
      }

      /* -----------------------------------------------------
       * Bluetooth
       * ----------------------------------------------------- */

       #bluetooth, #bluetooth.on, #bluetooth.connected {
          font-size: 12px;
          color: @textcolor1;
          margin: 5px 1px 6px 1px;
          padding: 0px 15px;
          border: 0px;
          border-radius: 15px;
          background-color: @background1;
      }

      #bluetooth.off {
          background-color: transparent;
          padding: 0px;
          margin: 0px;
      }

      /* -----------------------------------------------------
       * Battery
       * ----------------------------------------------------- */

      #battery {
          font-size: 12px;
          color: @textcolor1;
          margin: 5px 1px 6px 1px;
          padding: 0px 15px;
          border: 0px;
          border-radius: 15px;
          background-color: @background1;
      }

      #battery.charging, #battery.plugged {
          color: @textcolor2;
      }

      @keyframes blink {
          to {
              background-color: @background2;
              color: @textcolor2;
          }
      }

      #battery.critical:not(.charging) {
          color: #f53c3c;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      /* -----------------------------------------------------
       * System status
       * ----------------------------------------------------- */

      #memory, #cpu {
          margin: 5px 1px 6px 1px;
          padding: 0px 15px;
          border: 0px;
          border-radius: 15px;
          transition: none;
          color: @textcolor1;
          background-color: @background1;
      }

      /* -----------------------------------------------------
       * System updates
       * ----------------------------------------------------- */

      #custom-updates {
          margin: 5px 1px 6px 1px;
          padding: 0px 15px;
          border: 0px;
          border-radius: 15px;
          transition: none;
          background-color: @background1;
      }

      #custom-updates.green {
          color: #a6e3a1;
      }

      #custom-updates.yellow {
          color: #f9e2af;
      }

      #custom-updates.red {
          color: #f38ba8;
      }

    '';
  };

}
