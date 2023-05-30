indent_size = 4
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

vim.loader.enable()

g.mapleader = " "
g.python3_host_prog = "~/.mambaforge/envs/utils/bin/python"
g.catppuccin_flavour = "frappe"
-- g.python_recommended_style = 0

opt.nu = true
opt.wrap = false
opt.hidden = true
opt.backup = false
opt.incsearch = true
opt.expandtab = true
opt.showmode = false
opt.cursorline = true
opt.relativenumber = true
opt.scrolloff = 3
opt.encoding = "UTF-8"
opt.signcolumn = "yes"
opt.shortmess = "filnxtToOFc"
opt.completeopt = { "menuone", "noselect" }
opt.tabstop = indent_size
opt.softtabstop = indent_size
opt.shiftwidth = indent_size
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME") .. "/.local/share/nvim/undodir"
-- opt.colorcolumn = "100"

-- cmd([[
--     if has('termguicolors')
--         set termguicolors
--     endif
-- ]])
-- cmd([[colorscheme catppuccin]])
