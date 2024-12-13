return {
	"tpope/vim-repeat",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-abolish",
	"tpope/vim-rsi",

	-- LSP support
	"neovim/nvim-lspconfig",
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	"onsails/lspkind-nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "1.*",
		build = "make install_jsregexp",
	},
	"rafamadriz/friendly-snippets",
	{
		"folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      spec = {
        {"<leader>1", desc = "harpoon.ui.nav_file(1)" },
        {"<leader>2", desc = "harpoon.ui.nav_file(2)" },
        {"<leader>3", desc = "harpoon.ui.nav_file(3)" },
        {"<leader>4", desc = "harpoon.ui.nav_file(4)" },
        {"<leader>5", desc = "harpoon.ui.nav_file(5)" },
        {"<leader>*", desc = "builtin.grep_string" },
        {"<leader>a", desc = "harpoon.mark.add_file" },
        {"<leader>u", desc = "UndoTreeToggle" },
        {"<ledder>f", group = "file" },
        {"g", group = "+lsp" },
        {"<leader>v", group = "+lsp" },
        {"<leader>g", group = "+git" },
        {"<leader>f", group = "+telescope" },
        {"<leader>t", group = "+test/trouble" },
        {"<leader>x", group = "+cmd" }
      }
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      }
    }
	},
	-- {
    -- "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    -- event = "InsertEnter",
    -- config = function()
    --   require("copilot").setup({})
    -- end,
	-- },
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	}, 
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		-- version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	-- colors
	"dim13/smyck.vim",
	"jacoborus/tender.vim",
	"theprimeagen/harpoon",
	"tpope/vim-repeat",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-abolish",
	"tpope/vim-rsi",
	"onsails/lspkind-nvim",
}
