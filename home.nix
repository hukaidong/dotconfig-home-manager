{
  config,
  pkgs,
  plover-flake,
  emacs-overlay,
  ...
}:

{
  # ============================================================================
  # Basic Home Manager Configuration
  # ============================================================================

  imports = [ plover-flake.homeManagerModules.plover ];

  # User identification and basic setup
  home.username = "kaidong";
  home.homeDirectory = "/home/kaidong";
  home.stateVersion = "25.05";

  # Enable generic Linux compatibility (non-NixOS)
  targets.genericLinux.enable = true;

  # Self-manage Home Manager
  programs.home-manager.enable = true;

  # ============================================================================
  # Package Overlays
  # ============================================================================

  # Add Emacs overlay for bleeding-edge Emacs builds
  nixpkgs.overlays = [ emacs-overlay.overlays.default ];

  # ============================================================================
  # System Packages
  # ============================================================================

  # Packages installed to user environment
  home.packages = with pkgs; [
    bat
    nixfmt-rfc-style

    docker
    devcontainer
    texliveFull

    anki
    keepassxc

    python313
    python313Packages.pip

    # require by kickstart.nvim
    gcc
    gnumake
    unzip
    ripgrep
  ];

  # ============================================================================
  # Program Configuration
  # ============================================================================

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
    sessionVariables = { };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "Kaidong Hu";
    userEmail = "hukaidonghkd@gmail.com";
    attributes = [ "*.lock binary" ];
    ignores = [
      # IntelliJ project files
      ".idea"
      ".idea/*"
      ".iml"
      "out"
      "gen"

      # Vim
      "*~"
      "*.swp"
      "tags"

      # R
      ".RData"
      ".Rhistory"

      # Ruby yard
      ".yardoc"

      # Local files / runtimes
      ".localfiles"
      ".lvimrc"
      ".envrc"

      # Git merges
      "*.orgi"

      # Claude
      ".claude"
    ];
    extraConfig = {
      diff.tool = "nvimdiff";
      merge.tool = "nvimdiff";
    };
  };

  # Stenography setup with Plover
  programs.plover = {
    enable = true;

    # Use plover package with additional plugins
    package = plover-flake.packages.${pkgs.system}.plover.withPlugins (
      ps: with ps; [
        plover-lapwing-aio # Lapwing stenography theory
        plover-clippy-2
      ]
    );

    # Plover configuration settings
    settings = {
      "Machine Configuration" = {
        machine_type = "Gemini PR"; # Stenotype machine type
      };
      "Output Configuration" = {
        time_between_key_presses = 50;
        undo_levels = 100; # Undo history depth
      };
      "System".name = "Lapwing";
      Plugins.enabled_extensions = [
        "modal_update"
        "plover_clippy_2"
      ];

      "System: Lapwing".dictionaries = [
        {
          "enabled" = true;
          "path" = "user.json";
        }
        {
          "enabled" = true;
          "path" = "shell.json";
        }
        {
          "enabled" = true;
          "path" = "jeff-phrasing.py";
        }
        {
          "enabled" = true;
          "path" = "abby-left-hand-modifiers.py";
        }
        {
          "enabled" = true;
          "path" = "emily-modifiers.py";
        }
        {
          "enabled" = true;
          "path" = "emily-symbols.py";
        }
        {
          "enabled" = true;
          "path" = "lapwing-movement.modal";
        }
        {
          "enabled" = true;
          "path" = "lapwing-commands.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-numbers.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-uk-additions.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-proper-nouns.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-base.json";
        }
      ];
    };
  };

  # ============================================================================
  # File Management
  # ============================================================================

  # Managed dotfiles and configuration files
  home.file = {
    # Add custom dotfiles here as needed
    # Example: ".screenrc".source = ./dotfiles/screenrc;
  };

  # ============================================================================
  # Environment Variables
  # ============================================================================

  # Session-wide environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.shellAliases = {
    vim = "nvim";
  };

  home.sessionPath = [ "/home/kaidong/bin" ];
}
