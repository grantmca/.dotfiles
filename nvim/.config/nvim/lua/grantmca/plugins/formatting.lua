return {
  "stevearc/conform.nvim",
  -- event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        ruby = {
          "rubocop"
        },
        lua = {
          "stylua"
        },
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        }
      },
      -- format_on_save = {
      -- 	lsp_fallback = true,
      -- 	async = false,
      -- 	timeout_ms = 500,
      -- },
    })

    vim.keymap.set({ "n", "v" }, "<leader>p", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 10000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
