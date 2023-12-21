-- Bindings that help comment code
-- NOTE: This binds Ctrl-/ as <C-_> since that's what terminals interpret it as, apparently.
vim.keymap.set({"n", "x"}, "<leader>/", "<Plug>Commentary", { desc = "Comment lines" })
vim.keymap.set("n", "<leader>//", "<Plug>CommentaryLine", { desc = "Comment current line" })
vim.keymap.set({"n", "x"}, "<C-_>", "<Plug>Commentary", { desc = "Comment lines" })
vim.keymap.set("n", "<C-_><C-_>", "<Plug>CommentaryLine", { desc = "Comment current line" })
