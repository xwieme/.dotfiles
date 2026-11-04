{config, ...}: {
  programs.rofi.settings = {
    configuration = {
      display-drun = "Applications:";
      display-window = "Windows:";
      drun-display-format = "{name}";
      font = "FiraCode Nerd Font 12";
      modi = "window,run,drun";

      show-icons = true;
      icon-theme = "Papirus";
    };
  };

  programs.rofi.theme = let
    inherit (config.lib.format.rasi) mkLiteral;
  in {
    "*" = {
      bg = mkLiteral "mk #1e1e2e";
      bg-alt = mkLiteral "#585b70";
      bg-selected = mkLiteral "#313244";

      fg = mkLiteral "#cdd6f4";
      fg-alt = mkLiteral "#7f849c";

      border = 0;
      margin = 0;
      padding = 0;
      spacing = 0;
    };

    window = {
      width = mkLiteral "500px";
      background-color = mkLiteral "@bg";
    };

    element = {
      padding = 8 12;
      background-color = mkLiteral "transparent";
      text-color = mkLiteral "@fg-alt";
    };

    "element selected" = {
      text-color = mkLiteral "@fg";
      background-color = mkLiteral "@bg-selected";
    };

    element-text = {
      background-color = mkLiteral "transparent";
      text-color = mkLiteral "inherit";
      vertical-align = 0.5;
    };

    element-icon = {
      size = 14;
      padding = 0 10 0 0;
      background-color = mkLiteral "transparent";
    };

    entry = {
      padding = 12;
      background-color = mkLiteral "@bg-alt";
      text-color = mkLiteral "@fg";
    };

    inputbar = {
      children = mkLiteral "[prompt, entry]";
      background-color = mkLiteral "@bg";
    };

    listview = {
      background-color = mkLiteral "@bg";
      columns = 1;
      lines = 10;
    };

    mainbox = {
      children = mkLiteral "[inputbar, listview]";
      background-color = mkLiteral "@bg";
    };

    prompt = {
      enabled = true;
      padding = 12 0 0 12;
      background-color = mkLiteral "@bg-alt";
      text-color = mkLiteral "@fg";
    };
  };
}
