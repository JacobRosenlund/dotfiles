require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- `vim-tmux-navigator + nvchad` mappings
-- unmap("n", "<m-h>")
-- unmap("n", "<m-j>")
-- unmap("n", "<m-k>")
-- unmap("n", "<m-l>")
map("n", "<m-h>", "<cmd>:TmuxNavigateLeft<cr>")
map("n", "<m-j>", "<cmd>:TmuxNavigateDown<cr>")
map("n", "<m-k>", "<cmd>:TmuxNavigateUp<cr>")
map("n", "<m-l>", "<cmd>:TmuxNavigateRight<cr>")
map("n", "<m-\\>", "<cmd>:TmuxNavigatePrevious<cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
