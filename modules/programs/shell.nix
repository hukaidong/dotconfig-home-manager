{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
    sessionVariables = { };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.shellAliases = {
    vim = "nvim";
  };

  home.sessionPath = [ "/home/kaidong/bin" ];
}