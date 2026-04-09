local on_attach = function(env)
  local bufnr = env.buf
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  -- Built-in defaults in Neovim 0.12 (no need to map):
  --   gd  → definition
  --   gD  → declaration
  --   K   → hover
  --   gri → implementation
  --   grr → references
  --   gra → code action
  --   grn → rename
  --   gO  → document symbols
  --   Ctrl-S (insert) → signature help
  opts.desc = 'Show LSP diagnostic'
  keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  opts.desc = 'Show LSP format'
  keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>', opts)
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

