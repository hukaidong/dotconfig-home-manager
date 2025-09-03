{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Productivity applications
    anki
    keepassxc

    # Development IDEs and editors
    claude-code
    code-cursor
  ];
}