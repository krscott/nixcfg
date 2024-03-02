-- https://github.com/catppuccin/nvim

vim.cmd.colorscheme "catppuccin"

require("catppuccin").setup({
    flavour = "mocha",             -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
})
