vg = vim.g
cmd = vim.cmd
opt = vim.opt
vg.python3_host_prog = "~/.mambaforge/envs/utils/bin/python"

function keymap(mode, after, before, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, after, before, options)
end

function keymap_buf(bufnr, mode, after, before, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_buf_set_keymap(bufnr, mode, after, before, options)
end
