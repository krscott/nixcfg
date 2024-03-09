local wk = require('which-key')

wk.register({
    ['<leader>'] = {
        g = { name = "git" },
        p = { name = "project" },
    }
})

vim.o.timeout = true
vim.o.timeoutlen = 300
