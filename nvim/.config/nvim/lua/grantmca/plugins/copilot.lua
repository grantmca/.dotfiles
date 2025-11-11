return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = vim.fn.expand("$HOME") .. "/.n/n/versions/node/24.9.0/bin/node", -- Node.js version must be > 22
    })
  end,
}
