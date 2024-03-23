{ pkgs, specialArgs, ... }: 
let
  inherit (specialArgs.inputs) nixGL;
in
{
  nixGLPrefix = "${nixGL.packages.x86_64-linux.nixGLNvidia}/bin/nixGLNvidia-550.54.14";

  home.packages = with pkgs; [
    xorg.xinput
  ];

  # systemd.user.services.fix-touch = {
  #   Unit.Description = "Fix touch display settings";
  #   Install.WantedBy = [ "default.target" ];
  #   Service = {
  #     Type = "oneshot";
  #     ExecStart = ./fix-touch.sh;
  #   };
  # };
}
