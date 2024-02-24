return {
  "nvim-telescope/telescope.nvim",
  keys = {
    --{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Project: Find Files" },
    { "<C-p>", "<cmd>Telescope find_files<cr>" },
    -- {
    --   "<leader>ps",
    --   function()
    --     require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
    --   end,
    --   desc = "Project: Grep Search",
    -- },
    { "<leader>sx", "<cmd>Telescope resume<cr>", noremap = true, silent = true, desc = "Resume" },
  },
}
