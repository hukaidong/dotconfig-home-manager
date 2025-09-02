{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Build tools
    gcc
    gnumake
    unzip

    # Development utilities
    nixfmt-rfc-style
    ripgrep
    jq
    bat
    htop

    # Containerization
    docker
    devcontainer
  ];
}