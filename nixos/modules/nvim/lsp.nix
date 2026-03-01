{...}: {
  programs.nvf.settings.vim = {
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

    languages = {
      python = {
        enable = true;

        format = {
          enable = true;
          type = ["ruff"];
        };

        lsp = {
          enable = true;
          servers = ["pyright"];
        };
      };

      nix = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
      };
    };
  };
}
