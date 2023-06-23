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
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
      local wk = require("which-key")
			wk.setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
      wk.register({
        ["g"] = { name = "+lsp" },
        ["<leader>v"] = { name = "+lsp" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>f"] = { name = "+telescope" },
        ["<leader>t"] = { name = "+test/trouble" },
        ["<leader>*"] = { "builtin.grep_string" },
        ["<leader>a"] = { "harpoon.mark.add_file" },
        ["<leader>u"] = { "UndoTreeToggle" },
      })
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		build = ":Copilot",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
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
	}, -- colors
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
