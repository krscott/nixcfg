{ config, pkgs, inputs, ... }:
let
  inherit (import ../options.nix) nerdfont;
in
{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ nerdfont ]; })
  ];
}
