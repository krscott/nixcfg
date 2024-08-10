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

    ../scripts/sync-dots.nix
  ];

  home.packages = with pkgs; [
    # GUI
    firefox
    chromium
    nautilus
    
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
    la = "ls -A --color=auto";
    ll = "ls -lha --color=auto";
    direnv-init = "echo 'use flake . --impure' >> .envrc && direnv allow";
    start-ssh-agent = "eval `ssh-agent` && ssh-add";
  };
}
