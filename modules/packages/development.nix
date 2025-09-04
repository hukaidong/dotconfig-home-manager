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
    ripgrep

    # Containerization
    docker
    devcontainer
  ];
}
