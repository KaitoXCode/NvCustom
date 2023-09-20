local M = {}

function M.setup(_)
  -- so according to https://github.com/mfussenegger/nvim-dap-python readme:
  -- The debugger will automatically pick-up another virtual environment if it is activated before neovim is started.
  --
  require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python", {})
  -- require("dap-python").setup("~/code/credit_etl/.venv/bin/python", {})
  -- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  require("dap-python").test_runner = "pytest"
end

return M
