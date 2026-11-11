{pkgs, ...}: {
    programs.tmux = {
        
        prefix = "C-Space";
        mouse = true;
        keyMode = "vi";
        baseIndex = 1;
        sensibleOnTop = true;

        plugins = with pkgs.tmuxPlugins; [
           yank
           catppuccin
           vim-tmux-navigator
        ];

    };

}
