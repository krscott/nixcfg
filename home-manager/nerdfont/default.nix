{ config, pkgs, lib, ... }:
{
  options = {
    krs.nerdfonts.fonts = lib.mkOption {
      default = [ "JetBrainsMono" "Iosevka" "FantasqueSansMono" ];
      description = "Enabled Nerd Fonts";
    };
  };

  config = {
    home.packages = [
      (pkgs.nerdfonts.override {
        fonts = config.krs.nerdfonts.fonts;
      })
    ];

    fonts.fontconfig.enable = true;
  };
}
