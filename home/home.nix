{ config, pkgs, lib, inputs, ... }:
let
  krslib = import ../lib/krslib.nix { inherit lib; };
in
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

    ../scripts
  ];

  options.krs.wsl = {
    enable = krslib.mkEnableOptionFalse "wsl";
    home = krslib.mkStrOption "home" "/mnt/c/Users/kris";
  };

  config = {
    home.packages = with pkgs; [
      # CLI
      btop
      htop
      neofetch
      tldr
      direnv
      nix-direnv

      # Replacement utils 
      bat     # cat
      dust    # du
      eza     # ls
      fd      # find
      ripgrep # grep
      zoxide  # cd

      # Rust
      rustc
      cargo
      gcc # Required for linking
    ] ++ (
      if config.krs.wsl.enable then [
        # Windows (WSL)

        nautilus

      ] else [
        # Linux (Non-WSL)

        firefox
        chromium

        inputs.gnome-monitor-config.packages."${pkgs.system}".default

      ]
    );

    programs.autorandr.enable = true;
    programs.fzf.enable = true;

    home.shellAliases = {
      l = "exa";
      ls = "exa";
      la = "exa -a";
      ll = "exa -lah";
      cat = "bat -p";
      direnv-init = "echo 'use flake . --impure' >> .envrc && direnv allow";
      start-ssh-agent = "eval `ssh-agent` && ssh-add";
    } // (
      if config.krs.wsl.enable then {
        winhome = "cd ${config.krs.wsl.home}";
      } else {}
    );

    home.sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
    };
  };
}
