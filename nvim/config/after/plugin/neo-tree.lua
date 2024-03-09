-- https://github.com/nvim-neo-tree/neo-tree.nvim/

require('neo-tree').setup({
    close_if_last_window = true,
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_by_name = {
                ".git",
            },
            never_show = {
                ".git",
            },
        },
    },
})

vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle reveal<cr>', { desc = "Neotree" })
