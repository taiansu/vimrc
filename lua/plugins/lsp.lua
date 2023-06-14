return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = { -- LSP Support
		"neovim/nvim-lspconfig",
		{ "williamboman/mason.nvim", build = ":MasonUpdate" },
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"jay-babu/mason-null-ls.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		-- { 'tzachar/cmp-tabnine', build = './install.sh' },

		-- Snippets
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		lsp.ensure_installed({
			"elixirls",
			"lua_ls",
			"pyright",
			"tsserver",
			"rust_analyzer",
		})

		-- Fix Undefined global 'vim'
		lsp.nvim_workspace()

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-n>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			}, { "i", "s" }),
			["<ESC>"] = function(fallback)
				cmp.mapping.abort()
				fallback()
			end,
			["<C-e>"] = cmp.mapping.abort(),
			["<C-Space>"] = cmp.mapping.complete(),
		}, { "i", "s" })

		local cmp_sources = {
			{ name = "copilot" },
			{ name = "nvim_lsp", max_item_count = 10 },
			{ name = "buffer", max_item_count = 10 },
			{ name = "luasnip", max_item_count = 5 },
			{ name = "cmp_tabnine", max_item_count = 5 },
		}

		cmp_mappings["<Tab>"] = nil
		cmp_mappings["<S-Tab>"] = nil

		lsp.setup_nvim_cmp({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = cmp_sources,
			mapping = cmp_mappings,
		})

		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		lsp.on_attach(function(client, bufnr)
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.definition()" })
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.hover" })
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.workspace_symbol()" })
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, { buffer = bufnr, remap = false, desc = "" })
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, { buffer = bufnr, remap = false, desc = "vim.diagnostic.goto_next()" })
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, { buffer = bufnr, remap = false, desc = "vim.diagnostic.goto_prev()" })
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.code_action()" })
			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.references()" })
			vim.keymap.set("n", "gi", function()
				vim.lsp.buf.implementation()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.implementation()" })
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.rename()" })
			vim.keymap.set("n", "<leader>fm", function()
				vim.lsp.buf.format()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.format()" })
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, { buffer = bufnr, remap = false, desc = "vim.lsp.buf.signature_help()" })
		end)

		local wk = require("which-key")
		wk.register({
			["g"] = { name = "+lsp" },
			["<leader>v"] = { name = "+lsp" },
		})

		lsp.format_mapping("gq", {
			format_opts = {
				async = false,
				timeout_ms = 100000,
			},
			servers = {
				["elixirls"] = { "elixir" },
				["lua_ls"] = { "lua" },
				["rust_analyzer"] = { "rust" },
				-- if you have a working setup with null-ls
				-- you can specify filetypes it can format.
				["null-ls"] = { "javascript", "typescript" },
			},
		})

		lsp.setup()

		require("mason").setup()
		require("mason-null-ls").setup({
			ensure_installed = {
				-- Opt to list sources here, when available in mason.
				"prettier",
				"ts-standard",
				"sql-formater",
			},
			automatic_installation = false,
			handlers = {},
		})
		require("null-ls").setup({
			sources = {
				-- Anything not supported by mason.
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
