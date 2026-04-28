-- Run rubocop via bundle exec to use the project's Gemfile and avoid
-- version discrepancies with a standalone Mason install
return {
  cmd = { "bundle", "exec", "rubocop", "--lsp" },
}
