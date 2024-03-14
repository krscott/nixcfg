{ pkgs, ... }:

{
  imports = [
    ../git/git.nix
    ../nvim/nvim.nix
    ../tmux/tmux.nix
    ../zsh/zsh.nix
  ];

  home.packages = with pkgs; [
    btop
    fd
    htop
    neofetch
    ripgrep
    tldr
    nix-direnv
  ];
}
