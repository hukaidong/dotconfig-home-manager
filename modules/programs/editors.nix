{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mu
    davmail
    isync

    ((emacsPackagesFor emacs-git).emacsWithPackages (epkgs: [ epkgs.mu4e ]))
  ];
}
