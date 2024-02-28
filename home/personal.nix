{ config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ../git/git.nix
    ../kitty/kitty.nix
    ../zsh/zsh.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];
}
