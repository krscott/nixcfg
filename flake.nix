{
  description = "Kris's Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      inherit (import ./options.nix) mainUsername;

      mkHome = username: system: configPath:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            configPath
            {
              nix.package = pkgs.nix;
              home = {
                inherit username;
                homeDirectory = "/home/${mainUsername}";
              };
            }
          ];
        };
    in
    {
      homeConfigurations = {
        "${mainUsername}@x86_64-linux" = mkHome "${mainUsername}" "x86_64-linux" ./home/main-user.nix;
      };
    };
}
