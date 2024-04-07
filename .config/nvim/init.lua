require("remap")

-- Initialize Lazy package manager
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
-- Load configs in lua/plugins dir
require("lazy").setup("plugins")

-- Disable netrw creating random .netrwhist files
vim.g.netrw_dirhistmax = 0

-- Start scrolling when cursor reaches this many lines close to the edge
vim.opt.scrolloff = 3

-- Show line numbers
vim.opt.number = true

-- Don't need a useless ruler if we enable number
vim.opt.ruler = false

-- Auto read file when changed from the outside
vim.opt.autoread = true

-- Show location of cursor using a horizontal line
vim.opt.cursorline = true

-- Use system clipboard to yank (though may not work over SSH/tmux/Chrome OS)
vim.opt.clipboard = 'unnamed'

-- TODO: OSC yank

-- Ignore case in searching, except when it has uppercase letters  
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visualize whitespace
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,eol:¬,trail:·"

-- Set soft tabs to 4 spaces. Always use soft tabs.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
-- Don't round to nearest tabs (helps when trying to precisely set # of spaces)
vim.opt.shiftround = false
