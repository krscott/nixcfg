{ config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ../git/git.nix
    ../kitty/kitty.nix
    ../tmux/tmux.nix
    ../zsh/zsh.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];
}
