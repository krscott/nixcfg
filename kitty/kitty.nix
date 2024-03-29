{ config, pkgs, lib, ... }:
let
  krslib = import ../lib/krslib.nix { inherit lib; };
  nixgl = import ../lib/nixgl.nix { inherit pkgs config; };
  inherit (import ../options.nix) fontName fontSize;
in
{
  imports = [
    ../font/nerdfont.nix
  ];

  options = {
    krs.kitty.enable = krslib.mkEnableOptionTrue "kitty";
  };

  config = lib.mkIf config.krs.kitty.enable {
    home.shellAliases = {
      # Install kitty terminfo on servers
      #s = "kitty +kitten ssh";
    };

    programs.kitty = {
      enable = true;
      package = (nixgl pkgs.kitty);
      font.name = fontName;
      font.size = fontSize;
      extraConfig = builtins.readFile ./kitty.conf;
    };
  };
}
