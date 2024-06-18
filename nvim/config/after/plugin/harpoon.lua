local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file, { desc = "Harpoon: Add File" })
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = "Harpoon: Toggle Quick Menu" })

local function nav_file_fn(n)
    return function()
        ui.nav_file(n)
    end
end

-- local status, wk = pcall(require, "which-key")

for i = 1, 9 do
    vim.keymap.set('n', '<leader>' .. i, nav_file_fn(i), { desc = "which_key_ignore" })
    -- vim.keymap.set('n', '<leader>' .. i, nav_file_fn(i), { desc = "Harpoon: Goto " .. i })
    -- if status then
    --     wk.register({ ['<leader>' .. i] = "which_key_ignore" })
    -- end
end
