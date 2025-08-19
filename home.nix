{ config, pkgs, ... }:

{
  # ============================================================================
  # Basic Home Manager Configuration
  # ============================================================================
  
  # User identification and basic setup
  home.username = "kaidong";
  home.homeDirectory = "/Volumes/Storage/Users/kaidong";
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
  


  # ============================================================================
  # File Management
  # ============================================================================
  
  # Managed dotfiles and configuration files
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
