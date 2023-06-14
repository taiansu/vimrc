  return {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end,
    keys = {
      {'<leader>s', '<cmd>AerialToggle<cr>'}
    },
  }
