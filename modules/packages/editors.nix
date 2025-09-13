{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # emacs - provides latex preview
    texliveMedium
  ];
}
