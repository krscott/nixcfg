return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<C-p>", "<cmd>Telescope find_files find_command=rg,--hidden,--files,-g!.git<cr>" },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Grep Search",
      },
      { "<leader>sx", "<cmd>Telescope resume<cr>", noremap = true, silent = true, desc = "Resume" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>p"] = { name = "+project" },
      },
    },
  },
}
