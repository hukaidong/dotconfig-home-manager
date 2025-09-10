{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mu
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-git;
    extraPackages = epkgs: [ epkgs.mu4e ];
  };
}
