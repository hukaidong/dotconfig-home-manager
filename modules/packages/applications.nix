{ pkgs, nix-ai-tools-pkgs, ... }:

{
  home.packages = with pkgs; [
    # Productivity applications
    anki
    keepassxc
    zotero

    # Development IDEs and editors
    nix-ai-tools-pkgs.opencode
    nix-ai-tools-pkgs.claude-code
    nix-ai-tools-pkgs.cursor-agent
  ];
}
