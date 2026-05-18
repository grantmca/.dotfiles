return {
  "kepano/flexoki-neovim",
  name = "flexoki",
  config = function()
    vim.opt.background = "light"
    vim.cmd([[colorscheme flexoki-light]])

    -- Preserve syntax highlighting under diff backgrounds
    -- Uses subtle tinted backgrounds that don't overwrite foreground colors
    local hl = vim.api.nvim_set_hl
    hl(0, "DiffAdd", { bg = "#EDEECF", fg = "NONE" })      -- soft green tint
    hl(0, "DiffChange", { bg = "#DDF1E4", fg = "NONE" })    -- soft blue tint
    hl(0, "DiffDelete", { bg = "#FFE1D5", fg = "#b4637a" }) -- soft red tint, muted red text
    hl(0, "DiffText", { bg = "#E1ECEB", fg = "NONE" })      -- stronger blue for changed text within a line

    -- DiffView file panel highlights
    hl(0, "DiffviewDiffAddAsDelete", { bg = "#f0d4d4", fg = "NONE" })
    hl(0, "DiffviewDiffDelete", { fg = "#c0c0c0" })         -- muted filler lines
  end
}
