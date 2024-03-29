{ pkgs, ... }:
{
  imports = [
    ./core.nix

    ../theme/catppuccin.nix
    ../kitty/kitty.nix
    ../git/git.nix
    ../nvim/nvim.nix
    ../tmux/tmux.nix
    ../zsh/zsh.nix
    ../starship/starship.nix
  ];

  home.packages = with pkgs; [
    # GUI
    firefox
    chromium
    
    # CLI
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

  programs.autorandr.enable = true;
  programs.fzf.enable = true;
}
