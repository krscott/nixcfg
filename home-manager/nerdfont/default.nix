{ config, pkgs, lib, ... }:
{
  options = {
    krs.nerdfonts.fonts = lib.mkOption {
      default = [ "JetBrainsMono" "Iosevka" "FantasqueSansMono" ];
      description = "Enabled Nerd Fonts";
    };
  };

  config =
    let
      inherit (config.krs.nerdfonts) fonts;

      nerdfontPkg = (pkgs.nerdfonts.override { inherit fonts; });

      # symlinkFont = fontFamily: {
      #   ".local/share/fonts/${fontFamily}".source = "${nerdfontPkg}/share/fonts/truetype/NerdFonts";
      # };
    in
    {
      home.packages = [ nerdfontPkg ];

      fonts.fontconfig.enable = true;

      # home.file = lib.mkMerge (builtins.map symlinkFont fonts);
    };
}
