local M = {}

-- M.nullls =

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "json",
    "jsonc",
    "go",
    "gomod",
    "gosum",
    "gowork",
    -- "rust-analyzer",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "pyright",
    "mypy",
    "ruff",
    "pyright",
    "black",
    "debugpy",

    -- go stuff
    "gopls",
    "gotests",
    "go-debug-adapter",
    "goimports",
    "goimports-reviser",
    "delve",
    "gofumpt",

    -- docker stuff
    "dockerfile-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.gitsigns = {
  current_line_blame = true,
}

return M
