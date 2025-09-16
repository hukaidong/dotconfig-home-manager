{ pkgs, nix-ai-tools-pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # Productivity applications
    anki
    keepassxc
    zotero
    thunderbird
    discord

    # Fast developing application using unstable packages
    pkgs-unstable.android-studio
    pkgs-unstable.code-cursor-fhs

    # Development IDEs and editors
    nix-ai-tools-pkgs.opencode
    nix-ai-tools-pkgs.claude-code
    nix-ai-tools-pkgs.cursor-agent
  ];
}
