return {
  {
    "neovim/nvim-lspconfig",
    -- Go dosyalarında inlay hint'ler varsayılan olarak kapalı gelsin.
    -- gopls hint üretmeye devam ettiği için <leader>uh ile açıp kapatabiliriz.
    opts = function(_, opts)
      table.insert(opts.inlay_hints.exclude, "go")
    end,
  },
}
