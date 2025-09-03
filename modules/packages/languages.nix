{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python development
    (python313.withPackages (p: with p; [
      pip
      numpy
      ipython
      jupyter
    ]))
  ];
}
