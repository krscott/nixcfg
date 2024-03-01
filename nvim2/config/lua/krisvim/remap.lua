
vim.g.mapleader = " "

-- Fix smartindent putting '#' on column 0
vim.keymap.set("i", "#", "X<C-h>#")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "View Files" } )

