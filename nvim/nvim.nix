{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      harpoon
      nvim-treesitter.withAllGrammars
      telescope-nvim
      undotree
      vim-sensible
      vim-sleuth
      vim-tmux-navigator
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
      tree-sitter
      nodejs

      # telescope-nvim
      ripgrep
      fd
      # lazygit-nvim
      lazygit

      # Language Servers
      # (:help lspconfig-all)
      # Note: Don't forget to add lsp.<lang>.setup() in `lsp.lua`!

      # Bash
      nodePackages.bash-language-server
      # C
      clang
      # Go
      golangci-lint-langserver
      gopls
      # Lua
      lua-language-server
      # Nix
      nil
      nixpkgs-fmt
      statix
      # Python
      pyright
      black
      # Rust
      rust-analyzer
      # Typescript
      nodePackages.typescript-language-server
      # Web (ESLint, HTML, CSS, JSON)
      nodePackages.vscode-langservers-extracted
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
