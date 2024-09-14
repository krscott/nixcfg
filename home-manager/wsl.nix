{ config, lib, pkgs, ... }:
let
  krslib = import ../lib/krslib.nix { inherit lib; };
in
{
  options.krs.wsl = {
    enable = krslib.mkEnableOptionFalse "wsl";
    home = krslib.mkStrOption "home" "/mnt/c/Users/kris";
  };

  config = lib.mkIf config.krs.wsl.enable {
    home.packages = with pkgs; [
      nautilus
    ];

    home.shellAliases = {
      winhome = "cd ${config.krs.wsl.home}";
    };
  };
}
