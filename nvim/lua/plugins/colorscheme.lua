local function cs(plugin)
  local colorscheme = plugin.colorscheme or plugin.name

  plugin.colorscheme = nil
  plugin.priority = plugin.priority or 1000

  return {
    -- { repo, name = name, priority = 1000 },
    plugin,
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = colorscheme,
      },
    },
  }
end

-- return cs({ "catppuccin/nvim", name = "catppuccin", colorscheme = "catppuccin-latte" })
-- return cs({ "catppuccin/nvim", name = "catppuccin", colorscheme = "catppuccin-frappe" })
-- return cs({ "catppuccin/nvim", name = "catppuccin", colorscheme = "catppuccin-macchiato" })
return cs({ "catppuccin/nvim", name = "catppuccin", colorscheme = "catppuccin-mocha" })

-- return cs{"rose-pine/neovim", name = "rose-pine"}
