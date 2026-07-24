return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofumpt", "goimports" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    },
  },
}
