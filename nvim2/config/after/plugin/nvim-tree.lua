-- https://github.com/nvim-tree/nvim-tree.lua/

require('nvim-tree').setup({
    sort = {
        sorter = "name",
    },
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<cr>', { desc = "NvimTree: Open" })
vim.keymap.set('n', '<leader>E', '<cmd>NvimTreeClose<cr>', { desc = "NvimTree: Close" })
