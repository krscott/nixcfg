{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
