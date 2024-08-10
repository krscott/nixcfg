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
      sed = "${pkgs.gnused}/bin/sed";
      awk = "${pkgs.gawk}/bin/awk";
      grep = "${pkgs.gnugrep}/bin/grep";
      
      sync-dots = pkgs.writeShellScriptBin "sync-dots" ''
        mkdir -p ${config-dir}/git
        ${cp} ~/.config/git/config ${config-dir}/git/config
        ${sed} -i 's/\/nix\/store\/.*\/bin\///g' ${config-dir}/git/config

        ${cp} ~/.config/starship.toml ${config-dir}/starship.toml

        ${awk} '/# Aliases/{flag=1; next} /^$/{flag=0} flag' ~/.zshrc > ${home-dir}/.bash_aliases
        if ! ${grep} -Fxq "source ~/.bash_aliases" ${home-dir}/.bashrc; then
            echo "source ~/.bash_aliases" >> ${home-dir}/.bashrc
        fi
      '';
    in {
      home.packages = [ sync-dots ];
    }
  );
}
