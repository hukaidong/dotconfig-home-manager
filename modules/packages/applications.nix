{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Productivity applications
    anki
    keepassxc
    zotero

    # Development IDEs and editors
    claude-code
    code-cursor
  ];
}
