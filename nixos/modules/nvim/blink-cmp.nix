{...}: {
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
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
}
