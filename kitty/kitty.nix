{ pkgs, ... }:
let
  inherit (import ../options.nix) nerdfont;
in
{
  imports = [
    ../font/nerdfont.nix
  ];

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font.name = "${nerdfont} Nerd Font";
    font.size = 12;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
