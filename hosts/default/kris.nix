{ pkgs, lib, ... }: 
let
  username = "kris";
in
{
  imports = [ ../../home/personal.nix ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages = with pkgs; [ kate ];
  };
}
