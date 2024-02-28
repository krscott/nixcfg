{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12;
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
