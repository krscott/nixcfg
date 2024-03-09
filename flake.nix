{
  description = "KrixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (import ./options.nix) mainUsername;

      mkSystem = modules:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit modules;
        };

      mkHome = system: configPath:
        home-manager.lib.homeManagerConfiguration {
          inherit system;
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ configPath ];
        };
    in
    {
      nixosConfigurations = {
        default = mkSystem [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
        nixos-vm = mkSystem [
          inputs.disko.nixosModules.default
          ./hosts/nixos-vm/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
        ];
      };

      # Non-NixOS home-manager profiles
      homeConfigurations = {
        "${mainUsername}" = mkHome "x86_64-linux" ./home/main-user.nix;
      };
    };
}
