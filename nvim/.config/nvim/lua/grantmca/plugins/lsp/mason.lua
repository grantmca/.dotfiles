return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- LSP servers
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "lua-language-server",
        "pyright",
        "bash-language-server",
        "cucumber-language-server",
        "json-lsp",
        "gopls",
        "ruby-lsp",
        -- Formatters & linters
        "ruff",
        "stylua",
        "eslint_d",
      },
    })

    vim.lsp.enable({
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "pyright",
      "bashls",
      "cucumber_language_server",
      "jsonls",
      "gopls",
      "ruby_lsp",
      "rubocop",
    })
  end,
}
