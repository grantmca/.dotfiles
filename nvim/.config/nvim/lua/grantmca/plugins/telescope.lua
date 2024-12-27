return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        fzf = {}
      },
      defaults = {
        path_display = { "absolute" },
        prompt_prefix = " ",
        selection_caret = " ",
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout branch" } )
    keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme"  })
    keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" } )
    keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Find Help" } )
    keymap.set("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" } )
    keymap.set("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers"  })
    keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps"  })
    keymap.set("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands"  })

  end,
}
