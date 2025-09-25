{ pkgs, ... }:
# Minimum set of packages for Emacs org mode, see https://wiki.nixos.org/wiki/TexLive
let
  tex = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium
        dvisvgm
        dvipng # for preview and export as html
        wrapfig
        amsmath
        ulem
        hyperref
        capt-of
        ;
      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
    }
  );
in
{
  home.packages = with pkgs; [
    # emacs - provides latex preview
    tex
  ];
}
