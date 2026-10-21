-- Force all LSP clients to use the same position encoding to avoid conflicts
vim.lsp.config('*', {
  capabilities = {
    general = {
      positionEncodings = { 'utf-16' },
    },
  },
})

local on_attach = function(env)
  local buf = env.buf
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { buffer = buf, desc = desc })
  end
  map('gd', vim.lsp.buf.definition, 'Go to definition')
  map('<leader>lS', vim.lsp.buf.workspace_symbol, 'Workspace symbols')
  map('<leader>lh', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
  end, 'Toggle inlay hints')
  map('<leader>li', '<cmd>checkhealth vim.lsp<cr>', 'Show LSP Info')
  map('<leader>lf', vim.diagnostic.open_float, 'Show diagnostic details')
  map('<leader>lj', function() vim.diagnostic.jump({ count = 1 }) end, 'Next Diagnostic')
  map('<leader>lk', function() vim.diagnostic.jump({ count = -1 }) end, 'Previous Diagnostic')
  map('<leader>lq', vim.diagnostic.setloclist, 'LSP Quickfix')
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

