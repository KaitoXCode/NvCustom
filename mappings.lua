---@typehMappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- The following adds Tmux compatibility
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>gdu"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<leader>gdt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>gdl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gi"] = {
      function()
        vim.api.nvim_exec("GoIfErr", false)
      end,
      "Generate if error",
    },
    ["<leader>gj"] = {
      function()
        vim.api.nvim_exec(":GoTagAdd json", false)
      end,
      "Generate json tag",
    },
    ["<leader>gr"] = {
      function()
        vim.api.nvim_exec(":GoTagRm", false)
      end,
      "Generate remove tag",
    },
  },
}

return M
