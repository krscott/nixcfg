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
    ../win/sync-dots.nix
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
    gcc # Required for linking
  ];

  programs.autorandr.enable = true;
  programs.fzf.enable = true;

  home.shellAliases = {
    ls = "ls --color=auto";
    la = "ls -a --color=auto";
    ll = "ls -lha --color=auto";
    direnv-init = "echo 'use flake . --impure' >> .envrc && direnv allow";
  };
}
