return {
  -- Completely disable Neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Enable Snacks Explorer as the ONLY file explorer with hidden files visible
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = true,
        hidden = true,
        ignored = false,
      },
      picker = {
        hidden = true,
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
          explorer = { hidden = true, ignored = false },
        },
      },
    },
  },

  -- Telescope: Enable hidden files in search
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    },
  },

  -- Fzf-lua: Enable hidden files in search
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = { hidden = true },
      grep = { hidden = true },
    },
  },
}
