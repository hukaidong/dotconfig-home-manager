{ pkgs, homePath, ... }:

{
  # User identification and basic setup
  home.username = "kaidong";
  home.homeDirectory = "${homePath}/kaidong";
  home.stateVersion = "25.05";

  # Enable generic Linux compatibility (non-NixOS)
  targets.genericLinux.enable = true;

  # Self-manage Home Manager
  programs.home-manager.enable = true;

  # Package overlays and configuration
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Managed dotfiles and configuration files
  home.file = {
    # Add custom dotfiles here as needed
    # Example: ".screenrc".source = ./dotfiles/screenrc;
  };
}
