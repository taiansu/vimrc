vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]], {desc = 'Replace and keep'})

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Can't be bothered to understand ESC vs <C-c> in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-[>", "<Esc>")

vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- Apply Macros with Q and disable ex mode
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("v", "Q", "<cmd>norm @q<cr>")

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>xm", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/.config/nvim/lua/taiansu/packer.lua<CR>")

-- Clear the search buffer with <leader>xc
vim.keymap.set("n", "<leader>xv", "<cmd>command! TrailingWhiteSpaces %s/\\s\\+$//e<CR><cmd>nohlsearch<CR>")

-- JUMP TO THE COLUMN OF MARK
vim.keymap.set("n", "'", "`", { noremap = true })
vim.keymap.set("n", "`", "'", { noremap = true })
