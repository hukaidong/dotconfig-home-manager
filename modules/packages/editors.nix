{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # emacs - provides latex preview
    texliveSmall
    texlive.pkgs.dvipng
  ];
}
