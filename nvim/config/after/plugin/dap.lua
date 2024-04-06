local wk_exists, wk = pcall(require, 'which-key')
if (wk_exists) then
    wk.register({
        ['<leader>'] = {
            d = {
                name = "debug",
                s = { name = "step" },
                h = { name = "hover" },
                u = { name = "ui" },
                r = { name = "repl" },
                b = { name = "breakpoints" },
            },
        }
    })
end

local dap = require('dap')
local dapui = require('dapui')
--local dap_vars = require('dap.ui.variables')
--local widgets = require('dap.ui.widgets')

vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'DAP: Toggle UI' })
vim.keymap.set('n', '<F8>', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP: Toggle Breakpoint' })
vim.keymap.set('n', '<F9>', dap.step_out, { desc = 'DAP: Step Out' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'DAP: Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'DAP: Step Into' })

vim.keymap.set('n', '<leader>dsc', dap.continue, { desc = 'DAP: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dso', dap.step_out, { desc = 'DAP: Step Out' })
vim.keymap.set('n', '<leader>dsv', dap.step_over, { desc = 'DAP: Step Over' })
vim.keymap.set('n', '<leader>dsi', dap.step_into, { desc = 'DAP: Step Into' })

-- vim.keymap.set('n', '<leader>dhh', dap_vars.hover, { desc = 'DAP: Hover' })
-- vim.keymap.set('n', '<leader>dhf', dap_vars.visual_hover, { desc = 'DAP: Visual Hover' })

-- vim.keymap.set('n', '<leader>duh', widgets.hover, { desc = 'DAP: Hover Widgets' })
-- vim.keymap.set('n', '<leader>duf', function()
--     widgets.centered_float(widgets.scope)
-- end, { desc = 'DAP: Hover Widgets' })

-- vim.keymap.set('n', '<leader>dro', dap.repl.open, { desc = 'DAP: Open Repl' })
-- vim.keymap.set('n', '<leader>drl', dap.repl.run_last, { desc = 'DAP: Run Last Repl' })

vim.keymap.set('n', '<leader>dbc', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'DAP: Breakpoint Condition' })
vim.keymap.set('n', '<leader>dbm', function()
    dap.set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })
end, { desc = 'DAP: Log Point Message' })
vim.keymap.set('n', '<leader>ddt', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })

-- vim.keymap.set('n', '<leader>dc', dap_vars.scopes, { desc = 'DAP: Scopes' })
-- vim.keymap.set('n', '<leader>di', dap.toggle, { desc = 'DAP: Toggle' })
