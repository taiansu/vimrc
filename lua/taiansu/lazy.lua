vim.g.neo_tree_remove_legacy_commands = 1

require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup {
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  'jacoborus/tender.vim',
  'dim13/smyck.vim',

  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/playground',
    }
  },

  'theprimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-abolish',
  'tpope/vim-rsi',

  'onsails/lspkind-nvim',

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
      },
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jay-babu/mason-null-ls.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      -- { 'tzachar/cmp-tabnine', build = './install.sh' },

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
      },
      'rafamadriz/friendly-snippets',
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
      'arkav/lualine-lsp-progress'
    }
  },

  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    }
  },

  {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  'AndrewRadev/linediff.vim',

  {
    'zbirenbaum/copilot.lua',
    build = ":Copilot",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require("copilot_cmp").setup()
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true
      })
    end
  },

  'vim-test/vim-test'
})
