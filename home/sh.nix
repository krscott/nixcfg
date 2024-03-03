{ pkgs, ... }:

{
  imports = [
    ../git/git.nix
    ../nvim2/nvim.nix
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
  ];
}
