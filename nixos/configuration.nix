{ pkgs, lib, inputs, host, ... }:
let
  hostConfig = import
    if builtins.pathExists ./hosts/${host}/configuration.nix
    then ./hosts/${host}/configuration.nix
    else ./hosts/default/configuration.nix;
in
{
  imports = [
    hostConfig
    inputs.home-manager.nixosModules.default
  ]

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
