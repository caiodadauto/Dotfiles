ident_size = 4
vg.mapleader = ' '
vg.python_recommended_style = 0

opt.hidden = true
opt.backup = false
opt.undodir = vim.fn.expand "$HOME" .. '/.local/share/nvim/undodir'
opt.incsearch = true
opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.showmode = false
opt.completeopt = {'menuone', 'noselect'}
opt.encoding = 'UTF-8'
opt.shortmess = 'filnxtToOFc'
opt.colorcolumn = '88'
opt.cursorline = true
opt.wrap = false
opt.nu = true
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = ident_size
opt.softtabstop = ident_size
opt.shiftwidth = ident_size
opt.undofile = true

keymap('n', '<leader>/', [[:nohl<CR>]])
cmd [[
    if has('termguicolors')
        set termguicolors
    endif
]]
cmd [[colorscheme nord]]
