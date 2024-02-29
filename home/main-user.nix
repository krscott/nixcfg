{ config, pkgs, inputs, ... }:

{
  imports = [
    ./core.nix
    ../git/git.nix
    ../kitty/kitty.nix
    ../nvim2/nvim.nix
    ../tmux/tmux.nix
    ../zsh/zsh.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];
}
