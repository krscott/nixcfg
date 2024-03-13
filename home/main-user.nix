{ pkgs, lib, ... }:
{
  imports = [
    ./core.nix
    ./sh.nix

    ../kitty/kitty.nix
  ];

  options = {
    nixGLPrefix = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = ''
        Prepended wrapper for OpenGL applications.
      '';
      example = "\${nixGL.packages.x86_64-linux.nixGLNvidia}/bin/nixGLNvidia";
    };
  };

  config = {
    home.packages = with pkgs; [
      firefox
    ];

    programs.autorandr.enable = true;
  };
}
