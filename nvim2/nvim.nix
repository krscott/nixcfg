{ config, pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-sensible
      telescope-nvim
      nvim-treesitter.withAllGrammars
      harpoon
      undotree

      # Git
      vim-fugitive
      lazygit-nvim

      # Theme
      catppuccin-nvim
    ];

    extraPackages = with pkgs; [
      # telescope-nvim
      ripgrep
      fd
      # lazygit-nvim
      lazygit
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
