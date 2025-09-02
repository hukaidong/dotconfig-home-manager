{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python development
    python313
    python313Packages.pip
  ];
}