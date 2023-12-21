local builtin = require('telescope.builtin')

-- Open file fuzzy search in directory
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "[f]ind [c]ommands" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[f]ind [k]eymaps" })
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {}, { desc = "[f]ind in [f]ile" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, {}, { desc = "[f]ind [g]it files" })
vim.keymap.set('n', '<leader>f*', builtin.grep_string, {}, { desc = "[f]ind word in files" })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {}, { desc = "[f]ind [o]ldfiles" })
vim.keymap.set('n', '<leader>fb', builtin.oldfiles, {}, { desc = "[f]ind [b]uffers" })
-- I'm used to Space-b
vim.keymap.set('n', '<leader>b', builtin.oldfiles, {}, { desc = "find [b]uffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}, { desc = "[f]ind [h]elp" })
