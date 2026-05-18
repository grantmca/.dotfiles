return {
  "zk-org/zk-nvim",
  config = function()
    local zk = require("zk")

    zk.setup({
      -- can be "telescope", "fzf", "fzf_lua" or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope", "fzf" or "fzf_lua"
      picker = "telescope",

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { "zk", "lsp"},
          name = "zk",
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })

    local opts = { noremap=true, silent=false }
    local keymap = vim.keymap.set
    -- Insert links in place
    keymap("n", "<leader>zi", "<Cmd>ZkInsertLink<CR>", opts)

    -- Create a new note after asking for its title.
    keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

    -- Open notes associated with the selected tags.
    keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

    keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
    -- Search for the notes matching a given query.
    keymap("n", "-", "<Cmd>b#<CR>", opts)

    local commands = require("zk.commands")

    commands.add("ZkOrphans", function(options)
      options = vim.tbl_extend("force", { orphan = true }, options or {})
      zk.edit(options, { title = "Zk Orphans" })
    end)

    keymap("n", "<leader>zo", "<Cmd>ZkOrphans<CR>", opts)
  end
}
