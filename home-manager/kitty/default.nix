{ config, pkgs, lib, ... }:
let
  krslib = import ../../lib/krslib.nix { inherit lib; };
in
{
  imports = [
    ../nerdfont
    ../../lib/nixgl.nix
  ];

  options.krs.kitty = {
    enable = krslib.mkEnableOptionFalse "kitty";
    # Font must also be added to krs.nerdfonts.fonts in nerdfont.nix
    fontName = krslib.mkStrOption "Font Name" "FantasqueSansM Nerd Font";
    fontSize = krslib.mkIntOption "Font Size" 16;
  };

  config = lib.mkIf config.krs.kitty.enable (
    let
      kittyPkg = (config.nixgl pkgs.kitty);
    in 
    {
      home.shellAliases = {
        # Install kitty terminfo on servers
        #s = "kitty +kitten ssh";
      };

      programs.kitty = {
        enable = true;
        package = kittyPkg;
        font.name = config.krs.kitty.fontName;
        font.size = config.krs.kitty.fontSize;
        extraConfig = builtins.readFile ./kitty.conf;
      };

    } // (krslib.mkAppShortcut {
      inherit pkgs;
        name = "kitty";
        exec = "${kittyPkg}/bin/kitty";
        icon = "${kittyPkg}/lib/kitty/logo/kitty-128.png";
    })
  );
}
