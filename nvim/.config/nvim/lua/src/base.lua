Indent_size = 4
local g = vim.g
local opt = vim.opt

vim.loader.enable()

g.mapleader = " "
g.python3_host_prog = "~/.mambaforge/envs/utils/bin/python"

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
opt.tabstop = Indent_size
opt.softtabstop = Indent_size
opt.shiftwidth = Indent_size
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME") .. "/.local/share/nvim/undodir"
opt.termguicolors = true
