{ config, pkgs, ... }:

{
  # ============================================================================
  # Basic Home Manager Configuration
  # ============================================================================
  
  # User identification and basic setup
  home.username = "kaidong";
  home.homeDirectory = "/Users/kaidong";
  home.stateVersion = "25.05";
  
  # Self-manage Home Manager
  programs.home-manager.enable = true;

  # ============================================================================
  # Package Overlays
  # ============================================================================
  
  # Add Emacs overlay for bleeding-edge Emacs builds
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "sha256:0q6jcqyxgsgrk1pqiq68fdb58waf0mbd7cs9lnrqn9qg2bd4yzhy";
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
