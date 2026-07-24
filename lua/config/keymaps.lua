-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Helper to close current Vim tabpage if multiple exist, or current buffer tab via Snacks.bufdelete()
local function close_tab_or_buffer()
  if #vim.api.nvim_list_tabpages() > 1 then
    vim.cmd("tabclose")
  else
    Snacks.bufdelete()
  end
end

vim.api.nvim_create_user_command("Tabclose", close_tab_or_buffer, { desc = "Close current tab or buffer" })

-- Command alias so typing :tabclose or :tc safely closes the buffer tab
vim.cmd("cnoreabbrev <expr> tabclose (getcmdtype() == ':' && getcmdline() == 'tabclose') ? 'Tabclose' : 'tabclose'")
vim.cmd("cnoreabbrev <expr> tc (getcmdtype() == ':' && getcmdline() == 'tc') ? 'Tabclose' : 'tc'")

-- Keymaps:
map("n", "<leader>tc", close_tab_or_buffer, { desc = "Close Tab / Buffer" })
map("n", "<leader>x", close_tab_or_buffer, { desc = "Close Buffer (<leader>x)" })

