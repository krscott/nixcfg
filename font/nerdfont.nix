{ pkgs, ... }:
let
  inherit (import ../options.nix) nerdfont;
  nerdfontPkg = (pkgs.nerdfonts.override { fonts = [ nerdfont ]; });
in
{
  home.packages = [ nerdfontPkg ];

  # Required for running kitty with distrobox-export
  home.file.".local/share/fonts/nixpkg-nerdfonts".source = "${nerdfontPkg}/share/fonts";
}
