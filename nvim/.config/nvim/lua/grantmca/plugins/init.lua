return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  {
    "sindrets/diffview.nvim", -- for file history and diff views
    init = function()
      -- Patch unpack overflow in diffview completers (upstream issue #572)
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyLoad",
        callback = function(ev)
          if ev.data ~= "diffview.nvim" then return end
          local ok, dv = pcall(require, "diffview")
          if not ok then return end
          for name, fn in pairs(dv.completers) do
            dv.completers[name] = function(ctx)
              local success, result = pcall(fn, ctx)
              if success then return result end
              return {}
            end
          end
        end,
      })
    end,
  },
  "mbbill/undotree",
}
