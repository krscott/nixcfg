{ pkgs, ... }:
{
  imports = [
    ./core.nix
    ./gui.nix
    ./wsl.nix

    ./theme/catppuccin.nix

    ./git
    ./kitty
    ./nvim
    ./starship
    ./tmux
    ./zsh

    ./scripts
  ];

  home.packages = with pkgs; [
    # CLI
    neofetch
    tldr
    dust    # du replacement
    jq

    # Rust
    rustc
    cargo
    gcc # Required for linking

  ];

  programs = {

    # CLI
    autorandr.enable = true;
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
      ];
    };
    btop.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    eza.enable = true;
    fd.enable = true;
    fzf.enable = true;
    htop.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };

  home.shellAliases = {
    l = "eza";
    ls = "eza";
    la = "eza -a";
    ll = "eza -lah";
    cat = "bat -p";
    direnv-init = "echo 'use flake . --impure' >> .envrc && direnv allow";
    start-ssh-agent = "eval `ssh-agent` && ssh-add";
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}