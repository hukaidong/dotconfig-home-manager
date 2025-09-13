{
  # ============================================================================
  # Flake Metadata
  # ============================================================================
  
  description = "Home Manager configuration of kaidong";

  # ============================================================================
  # Input Dependencies
  # ============================================================================
  
  inputs = {
    # Core dependencies
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";  # Use same nixpkgs version
    };
    
    # Stenography tools and configuration
    plover-flake.url = "github:openstenoproject/plover-flake";
  };

  # ============================================================================
  # Output Configuration
  # ============================================================================
  
  outputs = { nixpkgs, home-manager, plover-flake, ... }:
    let
      # System architecture configuration
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Home Manager configuration for user 'kaidong'
      homeConfigurations."kaidong" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Configuration modules
        modules = [ 
          plover-flake.homeManagerModules.plover # Plover stenography module

          ./home.nix                            # Main home configuration
        ];

        # Pass flake inputs to home.nix for access to custom packages/configs
        extraSpecialArgs = {
          inherit plover-flake;
        };
      };
    };
}
