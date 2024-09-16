-- https://github.com/catppuccin/nvim

local status, catppuccin = pcall(require, "catppuccin")
if (status) then
    catppuccin.setup({
        flavour = "mocha",             -- latte, frappe, macchiato, mocha
        transparent_background = true, -- disables setting the background color.
        color_overrides = {
            mocha = {
                base = "#000000",
            },
        },
    })

    vim.cmd.colorscheme "catppuccin"

    -- vim-better-whitespace highlight red
    vim.api.nvim_set_hl(0, 'ExtraWhitespace', {
        ctermfg = 0,
        ctermbg = 9,
        bg = '#f38ba8'
    })
end
