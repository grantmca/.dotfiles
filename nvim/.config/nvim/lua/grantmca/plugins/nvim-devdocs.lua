local env_var = os.getenv("DOCS")

if env_var == "on" then
  return {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {}
  }
else
  return {}
end
