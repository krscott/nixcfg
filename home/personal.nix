{ config, pkgs, inputs, ... }:

{
  imports = [
    ./core.nix
    ../git/git.nix
    ../kitty/kitty.nix
    ../tmux/tmux.nix
    ../zsh/zsh.nix
  ];

  nixpkgs.overlays = [
    inputs.okay-vim.overlays.default
  ];

  home.packages = with pkgs; [
    firefox
    nvim-pkg # Added by okay-vim overlay
    (nerdfonts.override { inherit (import ../font/nerdfont.nix) fonts; })
  ];
}
