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

require("lazy").setup("plugins")

require("config.lsp")