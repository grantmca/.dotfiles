return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    -- { 'L3MON4D3/LuaSnip', version = 'v2.*' }, -- snippet engine
    "rafamadriz/friendly-snippets", -- useful snippets
    "fang2hou/blink-copilot"
  },
  version = '1.*',
  build = 'cargo build --release',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { 'lsp', 'copilot', 'snippets', 'buffer', 'path' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },

    fuzzy = { implementation = "rust" }
  },
  opts_extend = { "sources.default" }
}
