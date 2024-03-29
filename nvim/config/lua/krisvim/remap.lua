vim.g.mapleader = " "

-- Fix smartindent putting '#' on column 0
vim.keymap.set("i", "#", "X<C-h>#")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "View Files" })

-- Alt-J/K to move selection
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- Keep cursor in-place when removing newline
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in center of screen when paging
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Delete to void register
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Temporarily disable highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")
vim.keymap.set("n", "<C-c>", "<cmd>noh<cr>")

-- Replace word under cursor
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word" }
)

-- Cringe
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
