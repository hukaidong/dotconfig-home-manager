{
  config,
  pkgs,
  plover-flake,
  emacs-overlay,
  ...
}:

{
  # ============================================================================
  # Module Imports
  # ============================================================================

  imports = [
    ./modules/system.nix
    ./modules/packages/applications.nix
    ./modules/packages/development.nix
    ./modules/packages/editors.nix
    ./modules/packages/languages.nix
    ./modules/packages/nix.nix
    ./modules/programs/editors.nix
    ./modules/programs/git.nix
    ./modules/programs/plover.nix
    ./modules/programs/shell.nix
  ];

  # ============================================================================
  # Package Overlays
  # ============================================================================

  # Add Emacs overlay for bleeding-edge Emacs builds
  nixpkgs.overlays = [ emacs-overlay.overlays.default ];
}
