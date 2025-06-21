vim.lsp.enable('lua_ls')
vim.lsp.enable('openscad_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('ts_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
  end,
})

-- completions

local cmp = require('cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'hledger' },
        { name = 'path' },
        { name = 'buffer' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<Enter>'] = cmp.mapping.confirm(),
        ['<Tab>'] = cmp.mapping.confirm(),
    }),
    preselect = cmp.PreselectMode.None,
    completion = { completeopt = "menu,menuone,noselect" },
})
