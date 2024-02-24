return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add File" })
    vim.keymap.set("n", "<C-;>", ui.toggle_quick_menu)

    local function nav_file_fn(index)
      return function()
        ui.nav_file(index)
      end
    end

    for i = 1, 9 do
      vim.keymap.set("n", tostring(i), nav_file_fn(i))
    end
  end,
}
