return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- Python
        "pyright",
        "ruff",
        "black",
        "isort",
        "debugpy",
        -- Go
        "gopls",
        "gofumpt",
        "goimports",
        "delve",
        -- PHP
        "intelephense",
        "php-debug-adapter",
        "php-cs-fixer",
        -- Common tools
        "stylua",
        "shfmt",
      })
    end,
  },
}
