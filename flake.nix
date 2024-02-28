{
  description = "KrixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    okay-vim = {
      url = "github:krscott/okay-vim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
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
        "kris@default" = mkHome "x86_64-linux" ./hosts/default/kris.nix;
      };
    };
}
