local on_attach = function(env)
  local bufnr = env.buf
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  opts.desc = 'Go to declaration'
  keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  opts.desc = 'Show LSP definitions'
  keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  opts.desc = 'Show documentation for what is under cursor'
  keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  opts.desc = 'Show LSP implementations'
  keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  opts.desc = 'Show LSP references'
  keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  opts.desc = 'Show LSP diagnostic'
  keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  opts.desc = 'Show LSP format'
  keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>', opts)
  opts.desc = 'Show LSP Info'
  keymap(bufnr, 'n', '<leader>li', '<cmd>LspInfo<cr>', opts)
  opts.desc = 'Show LSP Install Info'
  keymap(bufnr, 'n', '<leader>lI', '<cmd>LspInstallInfo<cr>', opts)
  opts.desc = 'Code Action'
  keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  opts.desc = 'Next Diagnostic'
  keymap(bufnr, 'n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>', opts)
  opts.desc = 'Previous Diagnostic'
  keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>', opts)
  opts.desc = 'LSP Rename'
  keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  opts.desc = 'LSP Singature Help'
  keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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

