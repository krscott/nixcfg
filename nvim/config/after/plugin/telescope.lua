local builtin = require('telescope.builtin')

function find_files()
    builtin.find_files({
        find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
    })
end

-- vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope: Find Files in Git" })
vim.keymap.set('n', '<leader>pf', find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = "Help" })
