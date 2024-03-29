{ pkgs, ... }:

{
  imports = [
    ../git/git.nix
    ../nvim/nvim.nix
    ../tmux/tmux.nix
    ../zsh/zsh.nix
    ../starship/starship.nix
  ];

  home.packages = with pkgs; [
    btop
    fd
    htop
    neofetch
    ripgrep
    tldr
    direnv
    nix-direnv
    
    # Rust
    rustc
    cargo
  ];

  programs.fzf = {
    enable = true;
  };
}
