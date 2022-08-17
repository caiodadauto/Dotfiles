local M = {}

M.config = function()
    vim.g.coq_settings = {
        auto_start = "shut-up",
        clients = {
            lsp = {
                weight_adjust = 1.2,
            },
            buffers = {
                enabled = false,
            },
        },
        keymap = { recommended = false },
    }
    vim.g.coq_settings.keymap["repeat"] = "<c-L>"
    cmd([[let g:coq_settings = { 'keymap.repeat': '<c-l>' }]])

    keymap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
    keymap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
    keymap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
    keymap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
    keymap(
        "i",
        "<c-j>",
        [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
        { expr = true, noremap = true }
    )
end

return M
