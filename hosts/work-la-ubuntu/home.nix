{ inputs, ... }:
let
  inherit (inputs) nixGL;
in
{
  nixGLPrefix = "${nixGL.packages.x86_64-linux.nixGLNvidia}/bin/nixGLNvidia-*";
}
