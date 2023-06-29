  return {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup({
      layout = {
        min_width = 25,
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
      end,
    }) end,
    keys = {
      {'<leader>s', '<cmd>AerialToggle<cr>'}
    },
  }
