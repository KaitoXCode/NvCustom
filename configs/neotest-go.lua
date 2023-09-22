local M = {}

function M.setup()
  require("neotest").setup {
    adapters = {
      require "neotest-go" {
        dap = { jsutMyCode = false },
        experimental = {
          test_table = true,
        },
        args = { "-count=1", "-timeout=60s" },
      },
    },
  }
end

return M
