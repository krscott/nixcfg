{ config, pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-sensible
      telescope-nvim

      # Theme
      catppuccin-nvim
    ];

    extraPackages = with pkgs; [
      # telescope
      ripgrep
      fd
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
