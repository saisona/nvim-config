return {
  "supermaven-inc/supermaven-nvim",
  main = "supermaven-nvim",
  opts = {
    keymaps = {
      accept_suggestion = "<C-j>",
      accept_word = "<C-l>",
    },
    ignore_filetypes = {
      TelescopePrompt = false,
      TelescopeResults = false,
      FTerm = true,
      ["neo-tree"] = true,
    },
  },
}
