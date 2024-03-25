{ pkgs, specialArgs, ... }: 
let
  inherit (specialArgs.inputs) nixGL;
in
{
  nixGLPrefix = "${nixGL.packages.x86_64-linux.nixGLNvidia}/bin/nixGLNvidia-*";

  home.packages = with pkgs; [
    xorg.xinput
  ];
}
