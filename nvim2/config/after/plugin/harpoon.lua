local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

function nav_file_fn(n)
    return function()
        ui.nav_file(n)
    end
end

for i = 1, 9 do
    vim.keymap.set('n', '<leader>' .. i, nav_file_fn(i))
end
