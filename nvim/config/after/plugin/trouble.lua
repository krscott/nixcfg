local wk_exists, wk = pcall(require, 'which-key')
if (wk_exists) then
    wk.register({
        ['<leader>'] = {
            x = { name = "trouble" },
        }
    })
end

vim.keymap.set("n", "<leader>xx",
    function() require("trouble").toggle() end,
    { desc = "Trouble: Toggle" }
)
vim.keymap.set("n", "<leader>xw",
    function() require("trouble").toggle("workspace_diagnostics") end,
    { desc = "Trouble: Workspace Diagnostics" }
)
vim.keymap.set("n", "<leader>xd",
    function() require("trouble").toggle("document_diagnostics") end,
    { desc = "Trouble: Document Diagnostics" }
)
vim.keymap.set("n", "<leader>xq",
    function() require("trouble").toggle("quickfix") end,
    { desc = "Trouble: Quickfix" }
)
vim.keymap.set("n", "<leader>xl",
    function() require("trouble").toggle("loclist") end,
    { desc = "Trouble: Location List" }
)
vim.keymap.set("n", "gR",
    function() require("trouble").toggle("lsp_references") end,
    { desc = "Trouble: LSP References" }
)
vim.keymap.set("n", "gD",
    function() require("trouble").toggle("lsp_definitions") end,
    { desc = "Trouble: LSP Definitions" }
)
