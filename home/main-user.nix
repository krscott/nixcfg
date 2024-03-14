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
    };
  };

  config = {
    home.packages = with pkgs; [
      firefox
    ];

    programs.autorandr.enable = true;
  };
}
