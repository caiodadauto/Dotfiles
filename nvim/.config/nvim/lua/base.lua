Indent_size = 4
local g = vim.g
local opt = vim.opt
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})

vim.loader.enable()

g.mapleader = " "
g.maplocalleader = ";"
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

vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
