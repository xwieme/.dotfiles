{pkgs, ...}: {
  programs.neovim = {
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
      blink-cmp
      harpoon2
    ];
  };
}
