{pkgs, ...}: {
  programs.neovim = {
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      telescope-nvim
      blink-cmp
      harpoon2
      {
        plugin = nvim-lspconfig;
        config = "require(./nvim/lsp.lua)";
      }
    ];
    generatedConfigs = {
      lua = ''
        require(./nvim/keymaps.lua)
        require(./nvim/options.lua)
      '';
    };
  };
}
