{...}: {
  programs.nvf.settings.vim = {
    viAlias = false;
    vimAlias = true;
    debugMode = {
      enable = true;
      logFile = "/tmp/nvim.log";
    };

    options = {
      tabstop = 4;
    };

    keymaps = [
      {
        key = "<leader>pv";
        mode = "n";
        silent = true;
        action = ":Ex<CR>";
      }

      {
        key = "<C-d>";
        mode = "n";
        silent = true;
        action = "<C-d>zz";
      }

      {
        key = "<C-u>";
        mode = "n";
        silent = true;
        action = "<C-u>zz";
      }

      {
        key = "<S-g>";
        mode = "n";
        silent = true;
        action = "<S-g>zz";
      }

      {
        key = "jj";
        mode = "i";
        silent = true;
        action = "<Esc>";
      }
    ];

    spellcheck = {
      enable = true;
      languages = ["en_gb"];
    };

    utility = {
      undotree.enable = true;
    };

    visuals = {
      fidget-nvim.enable = true;
    };
  };
}
