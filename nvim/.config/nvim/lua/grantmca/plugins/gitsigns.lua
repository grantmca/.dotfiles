return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = function()
    require("gitsigns").setup()

    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>gj",
      "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
      { desc = "Next Hunk" }
    )
    keymap.set(
      "n",
      "<leader>gk",
      "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
      { desc = "Prev Hunk" }
    )
    keymap.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
    keymap.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
    keymap.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
    keymap.set("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" })
    keymap.set("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
    keymap.set("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })
    keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open changed file" })
    keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" })
    keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout commit" })
    keymap.set("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", { desc = "Checkout commit for current file" })
    keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Git Diff" })
  end,
}
