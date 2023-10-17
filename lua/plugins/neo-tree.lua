  return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    keys = {
      { '<leader>q', '<cmd>Neotree toggle<CR>' }
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    init = function ()
      vim.g.neo_tree_remove_legacy_commands = 1
      require("neo-tree").setup({
        close_if_last_window = false,
        enable_git_status = false,
        enable_diagnosticls = true,
        filesystem = {
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          follow_current_file = {
            enable = true,
          }
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(_) vim.opt_local.signcolumn = "auto" end
          }
        },
      })
    end
  }
