{ lib }:
{
  mkEnableOptionTrue = name: lib.mkOption {
    default = true;
    example = false;
    description = "Whether to enable ${name}.";
    type = lib.types.bool;
  };

  mkStrOption = description: default: lib.mkOption {
    inherit description default;
    type = lib.types.str;
  };

  mkIntOption = description: default: lib.mkOption {
    inherit description default;
    type = lib.types.int;
  };
}
