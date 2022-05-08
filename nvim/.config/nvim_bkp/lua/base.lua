vg = vim.g
cmd = vim.cmd
opt = vim.opt

function keymap(mode, after, before, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, after, before, options)
end
