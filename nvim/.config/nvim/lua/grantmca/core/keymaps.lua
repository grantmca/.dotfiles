-- Shorten function name
local keymap = vim.api.nvim_set_keymap --Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local add_desc = function(opts, desc)
  local new_opts = opts
  new_opts["desc"] = desc
  return new_opts
end

local opts = { noremap = true, silent = false }
keymap("", "<Space>", "<Nop>", opts)

-- delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- get rid of highlight
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", add_desc(opts, "Clear Highlight"))
keymap("n", "<leader>w", "<cmd>w<CR>", add_desc(opts, "Save Buffer"))

-- Navigate bNvimTreeToggleuffers
keymap("n", "<S-l>", "<cmd>bn<cr>", opts)
keymap("n", "<S-h>", "<cmd>bp<cr>", opts)

-- File Navigation
-- NvimTree
keymap("n", "<leader>e", "<cmd>Explore<cr>", opts)
keymap("n", "<leader>c", "<cmd>bd<cr>", opts)
keymap("n", "<leader><leader>c", "<cmd>bufdo bd<cr>", opts)

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

-- Move text up and down
-- Visual Block --
keymap("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)

