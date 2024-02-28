{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    inherit (import ../font/nerdfont.nix) font;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
