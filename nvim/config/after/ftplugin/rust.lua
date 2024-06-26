-- https://github.com/mrcjkb/rustaceanvim
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<leader>ca",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = true, buffer = bufnr, desc = "Code Action (Rust)" }
)

vim.keymap.set(
    "n",
    "<leader>cd",
    function() vim.cmd.RustLsp('debuggables') end,
    { buffer = bufnr, desc = "RustLsp: Debuggables" }
)
