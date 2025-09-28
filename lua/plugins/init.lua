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
	"nvimtools/none-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	"onsails/lspkind-nvim",

	-- Autocompletion
	{
		'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = { 'rafamadriz/friendly-snippets' },

		-- use a release tag to download pre-built binaries
		version = '1.*',
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = 'super-tab' },

			appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	},


	-- others

	"theprimeagen/harpoon",
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
  {
    "kassio/neoterm",
    init = function() vim.g.neoterm_default_mod = 'below' end
  },
	-- {
    -- "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    -- event = "InsertEnter",
    -- config = function()
    --   require("copilot").setup({})
    -- end,
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
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
	"drzel/vim-gui-zoom",
}
