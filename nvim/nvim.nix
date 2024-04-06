{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-sensible

      # Nav/UI
      harpoon
      telescope-nvim
      trouble-nvim
      undotree
      vim-tmux-navigator
      which-key-nvim

      # Editing
      autoclose-nvim
      tabout-nvim
      vim-commentary
      vim-sleuth

      # File Tree
      neo-tree-nvim
      #nvim-tree-lua
      nvim-web-devicons

      # Git
      vim-fugitive
      lazygit-nvim
      
      # Parsing/Highlighting
      nvim-treesitter.withAllGrammars
      todo-comments-nvim
      vim-illuminate

      # LSP
      lsp-zero-nvim
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      cmp_luasnip
      luasnip
      gleam-vim
      rustaceanvim

      # Debugging
      nvim-dap
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
      # Gleam
      gleam
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
      rustfmt
      # Typescript
      nodePackages.typescript-language-server
      # Web (ESLint, HTML, CSS, JSON)
      nodePackages.vscode-langservers-extracted

      # Debugging
      lldb
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
