-- Force all LSP clients to use the same position encoding to avoid conflicts
vim.lsp.config('*', {
  capabilities = {
    general = {
      positionEncodings = { 'utf-16' },
    },
  },
})

local on_attach = function(env)
  local bufnr = env.buf
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  opts.desc = 'Go to definition'
  keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  opts.desc = 'Show LSP diagnostic'
  keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  opts.desc = 'Show LSP Info'
  keymap(bufnr, 'n', '<leader>li', '<cmd>checkhealth vim.lsp<cr>', opts)
  opts.desc = 'Next Diagnostic'
  keymap(bufnr, 'n', '<leader>lj', '<cmd>lua vim.diagnostic.jump({count=1})<cr>', opts)
  opts.desc = 'Previous Diagnostic'
  keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.diagnostic.jump({count=-1})<cr>', opts)
  opts.desc = 'LSP Quickfix'
  keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true, -- this enables your defined signs
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = on_attach
})

