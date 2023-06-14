return {
	"tpope/vim-repeat",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-abolish",
	"tpope/vim-rsi",
	"onsails/lspkind-nvim",

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
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
