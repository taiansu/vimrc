require("config.options")
require("config.keymaps")

--- From pastleo/dotSetting, Thanks!
--- Define SafeRequire() globally to get plugins,
---   while preventing error when plugins not installed
--- @param module_name string
--- @return any
function SafeRequire(module_name)
  local status_ok, module = pcall(require, module_name)
  if not status_ok then
    return false
  end
  return module
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Treesitter fold（只需要這幾行）
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 99

-- 在特殊視窗停用 fold
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree", "lazy", "mason", "TelescopePrompt" },
  callback = function()
    vim.opt_local.foldmethod = 'manual'
  end,
})

require("lazy").setup("plugins")

require("config.lsp")
