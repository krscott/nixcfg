{ config, pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-sensible
      telescope-nvim
    ];

    extraPackages = with pkgs; [
      # telescope
      ripgrep
      fd
    ];

    # extraConfig = ''
    #   luafile ~/.config/nvim/lua/init.lua
    # '';
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
