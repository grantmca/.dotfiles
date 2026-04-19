return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_tool_installer = require("mason-tool-installer")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "ty",
        "bashls",
        "cucumber_language_server",
        "jsonls",
        "gopls",
        "ruby_lsp",
      },

      automatic_installation = true, -- not the same as ensure_installed
    })

    local lspconfig = require("lspconfig")
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({})
      end,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "rubocop", -- ruby formatter
        "ruff",
        "stylua",
        "eslint_d"
      },
    })
  end,
}
