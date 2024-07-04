return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local trouble = require('trouble.sources.telescope')

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
            ["<C-t>"] = trouble.open,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
          },
          n = {
            ["<C-t>"] = trouble.open,
            q = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        },
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
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

    local builtin = require('telescope.builtin')

    -- Falling back to find_files if git_files can't find a .git directory
    -- We cache the results of "git rev-parse"
    -- Process creation is expensive in Windows, so this reduces latency
    local is_inside_work_tree = {}

    function project_files()
      local opts = {} -- define here if you want to define something

      local cwd = vim.fn.getcwd()
      if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
      end

      if is_inside_work_tree[cwd] then
        builtin.git_files(opts)
      else
        builtin.find_files(opts)
      end
    end

    -- keymaps
    if vim.fn.exists("g:gui_vimr") == 1 then
      vim.keymap.set('n', '<D-p>', project_files, {})
    end
    vim.keymap.set('n', '<M-p>', project_files, {})
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
