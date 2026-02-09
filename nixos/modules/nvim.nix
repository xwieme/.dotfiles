{
  programs.nvf = {
    enable = true;
    
    settings.vim = {
      viAlias = false;
      vimAlias = true;
      debugMode = {
        enable = true;
        logFile = "/tmp/nvim.log";
      };

      spellcheck = {
        enable = true;
        languages = ["en_gb"];
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        otter-nvim.enable = true;
      };

      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };
      
      languages = {

        python = {
          enable = true;

          format = {
              enable = true;
              type = [ "ruff" ];
          };

          lsp = {
              enable = true;
              servers = [ "pyright" ];
          };
        };
      };

      treesitter.enable = true;

      telescope = {
        enable = true;
        mappings = {
          buffers = "<leader>fb";
          diagnostics = "<leader>fd";
          findFiles = "<leader>ff";
          liveGrep = "<leader>fg";
        };
      };

      utility = {
        undotree.enable = true;
      };

      visuals = {
        fidget-nvim.enable = true;
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };

      autocomplete.blink-cmp = {
        enable = true;
        mappings = {
            close = "<Esc>";
            complete = "<C-Space>";
            confirm = "<Tab>";
            next = "<C-j>";
            previous = "<C-k>";
        };
         setupOpts.signature.enabled = true;
      };

      diagnostics = {
        enable = true;
        config = {
            virtual_lines = true;
        };
      };

      ui = {
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            nix = "110";
            python = "79";
            rust = "100"; 
            c = "80";
          };
        };
      };

    };
  };
}
