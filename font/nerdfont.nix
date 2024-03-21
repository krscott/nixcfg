{ pkgs, lib, ... }:
let
  inherit (import ../options.nix) nerdfont;

  fonts = [
    nerdfont
    "JetBrainsMono"
  ]; 

  nerdfontPkg = (pkgs.nerdfonts.override { inherit fonts; });

  symlinkFont = fontFamily: {
    ".local/share/fonts/${fontFamily}".source = "${nerdfontPkg}/share/fonts/truetype/NerdFonts";
  };
in
{
  home.packages = [ nerdfontPkg ];

  home.file = lib.mkMerge (builtins.map symlinkFont fonts);
}
