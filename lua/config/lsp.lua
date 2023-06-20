if vim.g.vscode then
	return
end

local mason = SafeRequire('mason')
local mason_lspconfig = SafeRequire('mason-lspconfig')
local cmp_nvim_lsp = SafeRequire('cmp_nvim_lsp')
local lspconfig = SafeRequire('lspconfig')
local null_ls = SafeRequire('null-ls')

if
  mason == false or
  mason_lspconfig == false or
  cmp_nvim_lsp == false or
  lspconfig == false
then return end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(evt)
    -- Create your keybindings here...
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.hover" })
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.workspace_symbol" })
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = evt.buf, remap = false, desc = "" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = evt.buf, remap = false, desc = "vim.diagnostic.goto_next" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = evt.buf, remap = false, desc = "vim.diagnostic.goto_prev" })
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.code_action" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.references" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.implementation" })
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.rename" })
			vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.format" })
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = evt.buf, remap = false, desc = "vim.lsp.buf.signature_help" })
  end
})

local wk = require("which-key")
wk.register({
  ["g"] = { name = "+lsp" },
  ["<leader>v"] = { name = "+lsp" },
})

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'elixirls',
    'lua_ls',
    'pyright',
    'rust_analyzer',
    'tsserver',
  }
})

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})

null_ls.setup({})

vim.diagnostic.config({
  virtualtext = true,
})
