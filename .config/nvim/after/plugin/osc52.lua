-- OSC yank when manually set to + (unnamed) register
function copy()
  -- Uncomment this if you want to OSC yank on every yank. I don't do this
  -- since OSC yank can be really slow for large yanks.
  -- if vim.v.event.operator == 'y' and (vim.v.event.regname == '+' or vim.v.event.regname == '') then
  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
    require('osc52').copy_register('+')
  end
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

-- Ctrl-c in visual mode to manually yank
vim.keymap.set('v', '<C-c>', require('osc52').copy_visual)

