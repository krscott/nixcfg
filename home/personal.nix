{ config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ../git/git.nix
    ../zsh/zsh.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];
}
