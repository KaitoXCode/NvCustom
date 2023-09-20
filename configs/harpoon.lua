local M = {}

local whichkey = require "which-key"
local keys = {}

function keys.setup()
  local keymap = {
    p = {
      name = "Harpoon",
      o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu" },
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Haroon add file" },
      w = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file" },
      q = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
      -- x = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Test Method DAP" },  -- <- this would require user input
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
end

function M.setup()
  require("telescope").load_extension "harpoon"
  require("harpoon").setup {}
  -- require("keys.keymap").setup()
  keys.setup()
end

return M
