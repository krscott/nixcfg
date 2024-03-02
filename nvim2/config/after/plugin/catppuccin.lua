-- https://github.com/catppuccin/nvim

require("catppuccin").setup({
    flavour = "mocha",             -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    color_overrides = {
        mocha = {
            base = "#000000",
        },
    },
})

vim.cmd.colorscheme "catppuccin"
