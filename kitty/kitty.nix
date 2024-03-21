{ config, pkgs, ... }:
let
  nixgl = import ../lib/nixgl.nix { inherit pkgs config; };
  inherit (import ../options.nix) fontName fontSize;
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
    font.name = fontName;
    font.size = fontSize;
    theme = "Catppuccin-Mocha";
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
