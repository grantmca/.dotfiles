-- Launch through the rbenv shim (not Mason's copy, which is pinned to the Ruby
-- it was installed with) so the server runs on the project's .ruby-version and
-- can load native extensions from the project's bundle.
local ruby_lsp = vim.fn.expand("~/.rbenv/shims/ruby-lsp")

return {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start(
      { ruby_lsp },
      dispatchers,
      config and config.root_dir and { cwd = config.cmd_cwd or config.root_dir }
    )
  end,
  init_options = {
    formatter = "auto",
    linters = { "rubocop" },
    indexing = {
      excludedPatterns = {
        "**/db/migrate/**/*.rb",
        "**/vendor/bundle/**/*.rb",
      },
    },
    featuresConfiguration = {
      inlayHint = {
        implicitHashValue = true,
        implicitRescue = true,
      },
    },
  },
}
