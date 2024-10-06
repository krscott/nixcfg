{
  config,
  pkgs,
  lib,
  ...
}: let
  krslib = import ../../lib/krslib.nix {inherit lib;};
in {
  imports = [
    ../../lib/nixgl.nix
  ];

  options.krs.kitty = {
    enable = krslib.mkEnableOptionFalse "kitty";
    # Font must also be added to fonts.nix
    # fontName = krslib.mkStrOption "Font Name" "FantasqueSansM Nerd Font";
    fontName = krslib.mkStrOption "Font Name" "Iosevka Nerd Font";
    fontSize = krslib.mkIntOption "Font Size" 16;
  };

  config = lib.mkIf config.krs.kitty.enable {
    home.shellAliases = {
      # Install kitty terminfo on servers
      #s = "kitty +kitten ssh";
    };

    programs.kitty = {
      enable = true;
      package = config.nixgl pkgs.kitty;
      font.name = config.krs.kitty.fontName;
      font.size = config.krs.kitty.fontSize;
      extraConfig = builtins.readFile ./kitty.conf;
    };
  };
}
