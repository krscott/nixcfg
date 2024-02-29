{ pkgs, ... }:
let
  inherit (import ../options.nix) nerdfont;
in
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font.name = "${nerdfont} Nerd Font";
    font.size = 12;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
