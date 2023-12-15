local nnn = require("nnn")
local autopairs = require("nvim-autopairs")
local lastplace = require("nvim-lastplace")
local surround = require("nvim-surround")
local comment = require("Comment")
local colorizer = require("colorizer")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

nnn.setup()
comment.setup()
surround.setup()
lastplace.setup()
autopairs.setup()
colorizer.setup()

keymap.set("n", "<leader>n", "<cmd>NnnPicker %:p:h<CR>", opts)
