{ config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ../git/git.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];
}
