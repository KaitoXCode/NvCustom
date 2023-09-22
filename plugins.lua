local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python", "go" },
    -- opts = overrides.nullls,
    opts = function()
      require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          -- require "plugins.configs.lspconfig"
          -- require "custom.configs.lspconfig"
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.mtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
  -- Debugging
  --
  {
    "Pocco81/DAPInstall.nvim",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  -- go
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("custom.configs.dap").setup()
    end,
  },
  -- go stuff:
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    -- config moved to configs.dap.go
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    -- config moved to configs.dap.python
  },
  -- {
  --   ""
  -- },
  -- docker stuff:
  {
    "jamestthompson3/nvim-remote-containers",
  },
  {
    "esensar/nvim-dev-container",
    config = function()
      require("devcontainer").setup {}
      require("nvim-treesitter").setup()
    end,
  },
  {
    -- git stuff
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require "custom.configs.illuminate"
    end,
  },
  -- testing
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "antoinemadec/FixCursorHold.nvim",
    lazy = false,
  },
  {
    "nvim-neotest/neotest",
    ft = { "python", "go" },
  },
  {
    "nvim-neotest/neotest-python",
    ft = "python",
    config = function()
      require("custom.configs.neotest-python").setup()
    end,
  },
  {
    "nvim-neotest/neotest-go",
    ft = "go",
    config = function()
      require("custom.configs.neotest-go").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      require("custom.configs.harpoon").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump({search = {mode = function(str) return "\\<" .. str end,},}) end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}

return plugins
