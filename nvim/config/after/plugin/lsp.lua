local lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local defaults = { capabilities = capabilities }

lsp.bashls.setup(defaults)
lsp.clangd.setup(defaults)
lsp.cssls.setup(defaults)

lsp.eslint.setup({
  on_attach = function(_ --[[client]], bufnr)
    -- Format document on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

lsp.gleam.setup(defaults)
lsp.golangci_lint_ls.setup(defaults)
lsp.gopls.setup(defaults)
lsp.html.setup(defaults)
lsp.jsonls.setup(defaults)

lsp.lua_ls.setup({
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- E.g.: For using `vim.*` functions, add vim.env.VIMRUNTIME/lua.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })
    end
    return true
  end
})

lsp.nil_ls.setup(defaults)
lsp.pyright.setup(defaults)
lsp.rust_analyzer.setup(defaults)
lsp.tsserver.setup(defaults)
