-- Use space as leader
vim.g.mapleader = " " 

-- Open file explorer 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Easier bindings to create splits
vim.keymap.set("n", "<leader>\\", ":vsp<Enter>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>-", ":sp<Enter>", { desc = "Horizontal split" })

-- Move between split windows
vim.keymap.set("", "<leader>h", "<C-w>h", { desc = "Move to window left" })
vim.keymap.set("", "<leader>j", "<C-w>j", { desc = "Move to window down" })
vim.keymap.set("", "<leader>k", "<C-w>k", { desc = "Move to window up" })
vim.keymap.set("", "<leader>l", "<C-w>l", { desc = "Move to window right" })

-- Delete or paste without yanking deleted text
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { desc = "Delete without yank" })
vim.keymap.set("v", "<leader>p", "\"_dP", { desc = "Paste without yank" })

-- J/K in visual mode to move selected lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up line" })
