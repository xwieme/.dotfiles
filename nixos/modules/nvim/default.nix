{...}: {
  imports = [
    ./settings.nix
    ./theme.nix
    ./lsp.nix
    ./blink-cmp.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nvf = {
    enable = true;
  };
}
