return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "vimdoc",
          "luadoc",
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "ruby",
          "cpp",
          "c",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
        },
      })
    end,
  },
}
