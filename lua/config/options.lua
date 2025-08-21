vim.opt.clipboard = "unnamedplus"

vim.api.nvim_exec('language zh_TW.UTF-8', true)

vim.opt.nu = true

vim.opt.relativenumber = false

if vim.g.neovide then
    vim.g.neovide_input_ime = true
    vim.g.neovide_input_macos_option_key_is_meta = 'both'
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_input_use_logo = true -- Enable Cmd key

    -- Put anything you want to happen only in Neovide here
    vim.o.guifont = "Source Code Pro:h18"

    -- Allow clipboard copy paste in neovim
    vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
    vim.keymap.set('v', '<D-c>', '"+y') -- Copy
    vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

    -- vim.keymap.set('n', '<D-p>', project_files, {})
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- tabstop
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

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.cmd [[autocmd BufWritePre *.ex,*.exs,*.heex,*.rs lua vim.lsp.buf.format()]]

-- language providers
vim.g.python3_host_prog = '~/.mise/shims/python'


-- The line here make neovim can not fint the correct node host, so do not use it.
-- vim.g.node_host_prog = '~/.asdf/shims/node'
