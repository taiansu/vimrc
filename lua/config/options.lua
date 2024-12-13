vim.opt.clipboard = "unnamedplus"

vim.api.nvim_exec('language zh_TW.UTF-8', true)

vim.opt.nu = true

vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "110"

vim.opt.wildmode = "longest:full,list:full"

-- Make fugitive diff split vertically
vim.opt.diffopt:append("vertical")

vim.cmd [[autocmd BufWritePre *.ex,*.exs,*.heex,*.rs lua vim.lsp.buf.format()]]

-- language providers
vim.g.python3_host_prog = '~/.mise/shims/python'

vim.g.splitbelow = true
vim.g.splitright = true

-- The line here make neovim can not fint the correct node host, so do not use it.
-- vim.g.node_host_prog = '~/.asdf/shims/node'
