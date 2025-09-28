{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mu
    davmail
    isync

    ((emacsPackagesFor emacs-unstable).emacsWithPackages (epkgs: [ epkgs.mu4e ]))
  ];
}
