{ pkgs, plover-flake, ... }:

{
  programs.plover = {
    enable = true;

    # Use plover package with additional plugins
    package = plover-flake.packages.${pkgs.system}.plover.withPlugins (
      ps: with ps; [
        plover-lapwing-aio # Lapwing stenography theory
        plover-clippy-2
      ]
    );

    # Plover configuration settings
    settings = {
      "Machine Configuration" = {
        machine_type = "Gemini PR"; # Stenotype machine type
      };
      "Output Configuration" = {
        time_between_key_presses = 50;
        undo_levels = 100; # Undo history depth
      };
      "System".name = "Lapwing";
      Plugins.enabled_extensions = [
        "modal_update"
        "plover_clippy_2"
      ];

      "System: Lapwing".dictionaries = [
        {
          "enabled" = true;
          "path" = "user.json";
        }
        {
          "enabled" = true;
          "path" = "shell.json";
        }
        {
          "enabled" = true;
          "path" = "jeff-phrasing.py";
        }
        {
          "enabled" = true;
          "path" = "abby-left-hand-modifiers.py";
        }
        {
          "enabled" = true;
          "path" = "emily-modifiers.py";
        }
        {
          "enabled" = true;
          "path" = "emily-symbols.py";
        }
        {
          "enabled" = true;
          "path" = "lapwing-movement.modal";
        }
        {
          "enabled" = true;
          "path" = "lapwing-commands.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-numbers.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-uk-additions.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-proper-nouns.json";
        }
        {
          "enabled" = true;
          "path" = "lapwing-base.json";
        }
      ];
    };
  };
}
