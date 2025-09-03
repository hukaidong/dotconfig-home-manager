{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Build tools
    gcc
    gnumake
    unzip

    # Development utilities
    bat
    fd
    fzf
    htop
    jq
    nixfmt-rfc-style
    ripgrep

    # Containerization
    docker
    devcontainer
  ];
}
