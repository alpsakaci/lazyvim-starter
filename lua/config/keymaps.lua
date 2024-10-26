vim.api.nvim_del_keymap("n", "s")
vim.api.nvim_del_keymap("v", "s")
-- Increase window width
vim.api.nvim_set_keymap("n", "<S-Right>", ":vertical resize +10<CR>", { noremap = true, silent = true })
-- Decrease window width
vim.api.nvim_set_keymap("n", "<S-Left>", ":vertical resize -10<CR>", { noremap = true, silent = true })
-- Increase window height
vim.api.nvim_set_keymap("n", "<S-Up>", ":horizontal resize +10<CR>", { noremap = true, silent = true })
-- Decrease window height
vim.api.nvim_set_keymap("n", "<S-Down>", ":horizontal resize -10<CR>", { noremap = true, silent = true })
