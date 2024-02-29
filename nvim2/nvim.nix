{ config, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.okay-vim.overlays.default
  ];

  home.packages = with pkgs; [
    nvim-pkg # Added by okay-vim overlay
  ];
}
