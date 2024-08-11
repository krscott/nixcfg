{ pkgs, specialArgs, ... }: 
let
  inherit (specialArgs.inputs) nixGL;
in
{
  nixGLPrefix = "${nixGL.packages.x86_64-linux.nixGLNvidia}/bin/nixGLNvidia-*";

  home.packages = with pkgs; [
    xorg.xinput
  ];

  home.shellAliases = {
    mon219 = "gnome-monitor-config set -LpM DP-1 -t normal -m '3440x1440@144.001' -LM HDMI-1 -t normal -m '1024x600@59.821' -x 1208 -y 1440";
    mon169 = "gnome-monitor-config set -LpM DP-1 -t normal -m '2560x1440@143.999' -LM HDMI-1 -t normal -m '1024x600@59.821' -x 768 -y 1440
";
  };
}
