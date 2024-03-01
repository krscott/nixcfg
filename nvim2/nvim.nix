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
      which-key-nvim

      # File Tree
      neo-tree-nvim
      #nvim-tree-lua
      nvim-web-devicons

      # Git
      vim-fugitive
      lazygit-nvim

      # LSP
      lsp-zero-nvim
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip

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
