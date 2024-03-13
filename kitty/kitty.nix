{ config, pkgs, ... }:
let
  nixgl = import ../lib/nixgl.nix { inherit pkgs config; };
  inherit (import ../options.nix) nerdfont;
in
{
  imports = [
    ../font/nerdfont.nix
  ];

  home.shellAliases = {
    # Install kitty terminfo on servers
    #s = "kitty +kitten ssh";
  };

  programs.kitty = {
    enable = true;
    package = (nixgl pkgs.kitty);
    font.name = "${nerdfont} Nerd Font";
    font.size = 12;
    theme = "Catppuccin-Mocha";
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
