{ config, pkgs, lib, ... }:
let
  krslib = import ../lib/krslib.nix { inherit lib; };
in
{
  options.krs.sync-dots = {
    enable = krslib.mkEnableOptionFalse "sync-dots";
    home = krslib.mkStrOption "home" "/mnt/c/Users/kris";
  };

  config = lib.mkIf config.krs.sync-dots.enable (
    let
      home-dir = config.krs.sync-dots.home;
      config-dir = "${home-dir}/.config";
      # appdata-dir = "${home-dir}/AppData/Local";
      cp = "cp --no-preserve=mode,ownership";
      # rsync = "rsync -rptgoDuL --delete";
      
      sync-dots = pkgs.writeShellScriptBin "sync-dots" ''
        mkdir -p ${config-dir}/git
        ${cp} ~/.config/git/config ${config-dir}/git/config
        ${pkgs.gnused}/bin/sed -i 's/\/nix\/store\/.*\/bin\///g' ${config-dir}/git/config

        ${cp} ~/.config/starship.toml ${config-dir}/starship.toml
      '';
    in {
      home.packages = [ sync-dots ];
    }
  );
}
