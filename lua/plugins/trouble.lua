
  return {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup {
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    keys = {
      {"<leader>tq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true}},
      {"<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true}},
    }
  }
