# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;  
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  services = {
    xserver = {
    	enable = true;
    	xkb.layout = "us";
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

  };

  programs.xwayland.enable = true;
  programs.hyprland.enable = true;

  virtualisation.docker.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xander = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  nix.extraOptions = ''
  experimental-features = nix-command flakes
  '';


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # CLI apps
    wget
    gcc
    git
    lazygit
    gnugrep
    ripgrep
    gnumake
    cachix
    tmux
    yazi
    htop
    tree
    xcur2png
    # Window Manager
    hyprcursor
    hyprpaper
    libnotify
    mako
    trash-cli
    starship
    brightnessctl
    pamixer
    swaybg
    swaylock-effects
    waybar
    # Apps
    neovim 
    firefox
    ghostty
    rofi
    discord
    spotify
    thunderbird
    chromium
    vlc
    pavucontrol
    pulseaudio
  ];

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

	#  programs.tmux = {
	#      enable = true;
	#      shortcut = "Space";
	#      baseIndex = 1;
	#      plugins = with pkgs; [
	#        tmuxPlugins.vim-tmux-navigator
	#        tmuxPlugins.catppuccin
	#        tmuxPlugins.yank
	#      ];
	#      extraConfig = ''
	#        set-option -sa terminal-overrides ",xterm*:Tc"
	#        set -g mouse on
	#        bind C-l send-keys 'C-l' # Clear screen
	# bind '"' split-window -v -c "#{pane_current_path}"
	# bind % split-window -h -c "#{pane_current_path}"
	#      '';
	#  };

  nix = {
    package = pkgs.nixVersions.latest;
    settings = { 
    	trusted-substituters = [
          "http://cache.nixos.org"
        ];

        substituters = [
          "http://cache.nixos.org"
        ];
    };
    gc.automatic = false;
  };

}

