return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofumpt", "goimports" },
        php = { "php_cs_fixer" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    },
  },
}
