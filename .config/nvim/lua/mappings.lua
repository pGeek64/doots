require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "-", "<cmd>Oil<cr>")
map("n", "<leader>fr", "<cmd> Telescope oldfiles <CR>", { desc = "Find recent files" })


map("n","<leader>ht","<cmd>lua vim.cmd('Hardtime toggle')<cr>", {desc = "Hardtime toggle"})
map("n","<leader>he","<cmd>lua vim.cmd('Hardtime enable')<CR>", {desc = "Hardtime enable"})
map("n","<leader>hd","<cmd>lua vim.cmd('Hardtime disable')<CR>", {desc = "Hardtime disable"})
map("n","<leader>hr","<cmd>lua vim.cmd('Hardtime report')<CR>", {desc = "Hardtime report"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
