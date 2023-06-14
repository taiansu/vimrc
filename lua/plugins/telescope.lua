return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.1',
  -- or                            , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function ()
    local actions = require('telescope.actions')
    local trouble = require('trouble.providers.telescope')
    local telescope = require('telescope')

    telescope.load_extension('fzf')
    telescope.load_extension('harpoon')
    telescope.load_extension('aerial')
    telescope.load_extension("ui-select")

    telescope.setup {
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-t>"] = trouble.open_with_trouble,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
          },
          n = {
            ["<C-t>"] = trouble.open_with_trouble,
            q = actions.close,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown { }
        },
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        },
        aerial = {
          -- Display symbols as <root>.<parent>.<symbol>
          show_nesting = {
            ['_'] = false, -- This key will be the default
            json = true,   -- You can set the option for specific filetypes
            yaml = true,
          }
        }
      }
    }

    -- keymaps
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<C-M-p>', builtin.find_files, {})
    vim.keymap.set('n', '<M-p>', builtin.git_files, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fd', '<cmd>Telescope aerial<cr>', {})
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope git_status<cr>', {})
    vim.keymap.set('n', '<leader>ft', '<cmd>Telescope help_tags<cr>', {})
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope harpoon marks<cr>', {})
    vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>', {})
    vim.keymap.set('n', '<leader>fr', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
    vim.keymap.set('n', '<leader>*', builtin.grep_string, {})
  end,
}
