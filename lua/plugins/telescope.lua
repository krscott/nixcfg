local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>pf", builtin.find_files, desc = "Project: Find Files" },
    { "<C-p>", builtin.git_files },
    {
      "<leader>ps",
      function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "Project: Grep Search",
    },
    { "<leader>sx", builtin.resume, noremap = true, silent = true, desc = "Resume" },
  },
}
