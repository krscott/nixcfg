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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkSystem = configPath:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            configPath
            inputs.home-manager.nixosModules.default
          ];
        };

      mkHome = configPath:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ configPath ];
        };
    in
    {
      nixosConfigurations = {
        default = mkSystem ./hosts/default/configuration.nix;
      };

      homeConfigurations = {
        "kris@default" = mkHome ./hosts/default/home.nix;
      };
    };
}
