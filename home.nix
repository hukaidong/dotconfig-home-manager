{ config, pkgs, plover-flake, ... }:

{
  # ============================================================================
  # Basic Home Manager Configuration
  # ============================================================================
  
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
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:0pain4dpyc9bgi5kffix2nfrqp0c1f19na08yf7g6lazw3l059n2";
    }))
  ];

  # ============================================================================
  # System Packages
  # ============================================================================
  
  # Packages installed to user environment
  home.packages = [
    pkgs.emacs-git  # Latest Emacs from overlay
  ];

  # ============================================================================
  # Program Configuration
  # ============================================================================
  
  # Stenography setup with Plover
  programs.plover = {
    enable = true;
    
    # Use plover package with additional plugins
    package = plover-flake.packages.${pkgs.system}.plover.withPlugins (
      ps: with ps; [
        plover-lapwing-aio  # Lapwing stenography theory
      ]
    );

    # Plover configuration settings
    settings = {
      "Machine Configuration" = {
        machine_type = "Gemini PR";  # Stenotype machine type
        auto_start = true;           # Start automatically
      };
      "Output Configuration".undo_levels = 100;  # Undo history depth
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
    # Add environment variables here as needed
    # Example: EDITOR = "emacs";
  };
}