{ config, lib, pkgs, ... }:
let
  krslib = import ../lib/krslib.nix { inherit lib; };
in
{
  options.krs.guiApps.enable = krslib.mkEnableOptionFalse "guiApps";

  config = lib.mkIf config.krs.guiApps.enable {
    programs = {
      firefox.enable = true;
      chromium.enable = true;
    };

    home.packages = with pkgs; [
      obsidian
    ];
  };
}
