return {
  dir="~/Developer/plugins/omnivore.nvim",
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('omnivore').setup()
    require('telescope').load_extension('omnivore')
  end,
  -- dev = true
}

