{ pkgs, nix-ai-tools, ... }:

{
  home.packages = with pkgs; [
    # Productivity applications
    anki
    keepassxc
    zotero

    # Development IDEs and editors
    nix-ai-tools.opencode
    claude-code
    code-cursor
  ];
}
