-- Avoid slow pyenv probing; no configured plugins require the Python provider.
vim.g.loaded_python3_provider = 0

require("grantmca.core")
require("grantmca.lazy")
