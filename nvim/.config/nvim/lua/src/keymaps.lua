local keymap = vim.keymap
local diagnostic = vim.diagnostic
local opts = { noremap = true, silent = true }

keymap.set('n', '<space>e', diagnostic.open_float)
keymap.set('n', '[d', diagnostic.goto_prev)
keymap.set('n', ']d', diagnostic.goto_next)
keymap.set('n', '<space>q', diagnostic.setloclist)
keymap.set("n", "<leader>/", [[:nohl<CR>]], opts)
