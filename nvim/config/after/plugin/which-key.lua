local wk = require('which-key')

wk.register({
    ['<leader>'] = {
        c = { name = "code" },
        g = { name = "git" },
        p = { name = "project" },
        v = { name = "void-register" }
    }
})

vim.o.timeout = true
vim.o.timeoutlen = 300
