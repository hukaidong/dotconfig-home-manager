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
    ./modules/packages/development.nix
    ./modules/packages/applications.nix
    ./modules/packages/languages.nix
    ./modules/programs/editors.nix
    ./modules/programs/shell.nix
    ./modules/programs/git.nix
    ./modules/programs/plover.nix
  ];

  # ============================================================================
  # Package Overlays
  # ============================================================================

  # Add Emacs overlay for bleeding-edge Emacs builds
  nixpkgs.overlays = [ emacs-overlay.overlays.default ];
}
