{ lib, ... }:
{
  options.nixGLPrefix = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
      Prepended wrapper for OpenGL applications.
    '';
  };
}
