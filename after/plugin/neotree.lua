require("neo-tree").setup({
  close_if_last_window = false,
  enable_git_status = false,
  enable_diagnosticls = true,
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_) vim.opt_local.signcolumn = "auto" end
    }
  },
})

vim.keymap.set("n", "<leader>q", "<cmd>Neotree toggle<CR>")
