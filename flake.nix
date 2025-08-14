{
  description = "Home Manager configuration of kaidong";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plover-flake.url = "github:openstenoproject/plover-flake";
  };

  outputs =
    { nixpkgs, home-manager, plover-flake, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."kaidong" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./home.nix 
          plover-flake.homeManagerModules.plover
        ];

        # Pass custom flake inputs to home.nix
        extraSpecialArgs = {
          inherit plover-flake;
        };
      };
    };
}
