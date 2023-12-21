vim.o.background = "dark"

require("gruvbox").setup({
    overrides = {
        DiffChange = {bg = "#b57614"}
    }
})

vim.cmd("colorscheme gruvbox")
