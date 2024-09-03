{ config, pkgs, lib, inputs, ... }:
let
  krslib = import ../lib/krslib.nix { inherit lib; };
  guiEnabled = !config.krs.wsl.enable;
in
{
  imports = [
    ./core.nix

    ./theme/catppuccin.nix
    ./kitty
    ./git.nix
    ./nvim
    ./tmux
    ./zsh
    ./starship.nix

    ./scripts
  ];

  options.krs.wsl = {
    enable = krslib.mkEnableOptionFalse "wsl";
    home = krslib.mkStrOption "home" "/mnt/c/Users/kris";
  };

  config = {
    home.packages = with pkgs; [
      # CLI
      neofetch
      tldr
      direnv
      nix-direnv
      dust    # du replacement

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

        inputs.gnome-monitor-config.packages."${pkgs.system}".default

      ]
    );

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
      eza.enable = true;
      fd.enable = true;
      fzf.enable = true;
      htop.enable = true;
      ripgrep.enable = true;
      zoxide.enable = true;

      # GUI
      firefox.enable = guiEnabled;
      chromium.enable = guiEnabled;
    };


    home.shellAliases = {
      l = "eza";
      ls = "eza";
      la = "eza -a";
      ll = "eza -lah";
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
