-- Shorten function name
local keymap = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = false }

keymap("", "<Space>", "<Nop>", opts)

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- get rid of highlight
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear Highlight" })
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save Buffer" })

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bn<cr>", opts)
keymap("n", "<S-h>", "<cmd>bp<cr>", opts)

-- File Navigation
-- NvimTree
keymap("n", "<leader>e", "<cmd>Explore<cr>", opts)
keymap("n", "<leader>x", "<cmd>bd<cr>", opts)

local closeAll = function()
  local current = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted and not vim.bo[buf].modified then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end

keymap("n", "<leader><leader>x", closeAll, { desc = "Close all buffers except current" })

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", "<cmd>m .+1<CR>==", opts)
keymap("v", "K", "<cmd>m .-2<CR>==", opts)

-- Copy file info to clipboard
keymap("n", "<leader>cf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
  print("File name coppied...")
end, { desc = "Copy filename to clipboard" })

keymap("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
  print("File path coppied...")
end, { desc = "Copy relative path to clipboard" })

-- Move text up and down
-- Visual Block --
keymap("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)
