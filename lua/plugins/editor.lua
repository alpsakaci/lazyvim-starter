return {
  -- Disable Neo-tree completely (Snacks Explorer is the single file explorer)
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Enable Snacks Explorer & Picker with full hidden directory search
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = true,
        hidden = true,
        ignored = true,
      },
      picker = {
        hidden = true,
        ignored = true,
        sources = {
          files = {
            hidden = true,
            ignored = true,
            cmd = "rg",
            args = { "--files", "--hidden", "--glob", "!.git/*" },
          },
          grep = {
            hidden = true,
            ignored = true,
            cmd = "rg",
            args = { "--hidden", "--glob", "!.git/*" },
          },
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },

  -- Telescope: Enable hidden files & directories in find_files and live_grep
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
          "--glob",
          "!.git/*",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob", "!.git/*" }
          end,
        },
      },
    },
  },

  -- Fzf-lua: Enable hidden files & directories in search
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        cmd = "rg --files --hidden --glob '!.git/*'",
      },
      grep = {
        rg_opts = "--hidden --glob '!.git/*'",
      },
    },
  },
}
