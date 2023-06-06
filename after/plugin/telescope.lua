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
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
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
vim.keymap.set('n', '<D-p>', builtin.find_files, {})
vim.keymap.set('n', '<M-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope aerial<cr>', {})
vim.keymap.set('n', '<leader>fl', '<cmd>Telescope live_grep<cr>', {})
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope help_tags<cr>', {})
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope harpoon marks<cr>', {})
vim.keymap.set('n', '<leader>/', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

