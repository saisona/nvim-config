return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  event = "User Astrofile",
  cmd = { "TodoQuickFix" },
  keys = {
    {
      "<leader>T",
      "<cmd>TodoTelescope<cr>",
      desc = "Open Todo in Telescope",
    },
  },
}
