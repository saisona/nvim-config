return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
  },
  opts = {},
  keys = {
    {
      "<leader>Gc",
      "<cmd>GoCoverage<cr>",
      desc = "Launch coverage of the file",
    },
    { "<leader>Gt", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run File" },
    { "<leader>GT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
    { "<leader>Gr", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>Gs", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    {
      "<leader>Go",
      function() require("neotest").output.open { enter = true, auto_close = true } end,
      desc = "Show Output",
    },
    { "<leader>GO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<leader>GS", function() require("neotest").run.stop() end, desc = "Stop" },
  },
}
