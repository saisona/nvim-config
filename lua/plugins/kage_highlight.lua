return {
  "sedyh/ebitengine-kage-vim",
  ft = "kage",
  config = function()
    for _, b in ipairs(vim.tbl_filter(function(b) return vim.bo[b].filetype == "toml" end, vim.api.nvim_list_bufs())) do
      vim.bo[b].filetype = "kage"
    end
  end,
}
