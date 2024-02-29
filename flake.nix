{
  description = "KrixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (import ./options.nix) mainUsername;

      mkSystem = configPath:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            configPath
            inputs.home-manager.nixosModules.default
          ];
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
        default = mkSystem ./hosts/default/configuration.nix;
      };

      # Non-NixOS home-manager profiles
      homeConfigurations = {
        "${mainUsername}" = mkHome "x86_64-linux" ./home/main-user.nix;
      };
    };
}
