local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Make gq use the lsp formatter
-- TODO: figure out if it can do partial formatting
lsp_zero.format_mapping('gq', {
  servers = {
    ['rust_analyzer'] = {'rust'},
    ['tsserver'] = {'javascript', 'typescript'},
  }
})


-- Set up lua lsp for nvim config
local lua_opts = lsp_zero.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)

-- Use mason to manage lsp servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer', 'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
  },
})
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}

require('lsp-zero').extend_cmp()

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'hledger' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<Enter>'] = cmp.mapping.confirm(),
        ['<Tab>'] = cmp.mapping.confirm(),
    }),
    -- preselect first item
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})
