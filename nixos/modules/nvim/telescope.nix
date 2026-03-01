{...}: {
  programs.nvf.settings.vim.telescope = {
    enable = true;
    mappings = {
      buffers = "<leader>fb";
      diagnostics = "<leader>fd";
      findFiles = "<leader>ff";
      liveGrep = "<leader>fg";
    };
  };
}
