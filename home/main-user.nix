{ pkgs, ... }:

{
  imports = [
    ./core.nix
    ./sh.nix

    ../kitty/kitty.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];

  programs.autorandr.enable = true;
}
