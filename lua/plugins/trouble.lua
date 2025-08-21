return {
  'folke/trouble.nvim',
  config = function()
    require("trouble").setup {
      icons = {},
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end,
  keys = {
    { "<leader>tq", "<cmd>Trouble quickfix toggle<cr>",             { silent = true, noremap = true } },
    { "<leader>td", "<cmd>Trouble document_diagnostics toggle<cr>", { silent = true, noremap = true } },
  }
}
