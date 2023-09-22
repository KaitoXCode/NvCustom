local M = {}

local whichkey = require "which-key"
local keys = {}

function keys.setup()
  local keymap = {
    t = {
      name = "Neotest",
      m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
      M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
      c = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
      C = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
    },
  }

  whichkey.register(keymap, {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })

  local keymap_v = {
    name = "Neotest",
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
  }
  whichkey.register(keymap_v, {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })
end

function M.setup()
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { jsutMyCode = false },
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    },
  }
  -- require("keys.keymap").setup()
  keys.setup()
end

return M
