{pkgs, ...}: {
  programs.neovim = {
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
      nvim-treesitter
      {
        plugin = telescope-nvim;
        config = builtins.readFile ./nvim/telescope.lua;
      }
      {
        plugin = blink-cmp;
        config = builtins.readFile ./nvim/blink-cmp.lua;
      }
      {
        plugin = harpoon2;
        config = builtins.readFile ./nvim/harpoon.lua;
      }
      {
        plugin = nvim-lspconfig;
        config = builtins.readFile ./nvim/lsp.lua;
      }
    ];
    initLua = ''
        ${builtins.readFile ./nvim/keymaps.lua}
        ${builtins.readFile ./nvim/options.lua}
    '';
  };
}
