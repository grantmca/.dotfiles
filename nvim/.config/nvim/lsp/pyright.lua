return {
  -- ty owns diagnostics; Pyright provides hover, completion, and navigation.
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "standard",
      },
    },
  },
}
