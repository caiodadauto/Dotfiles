local M = {}

M.config = function()
    keymap("n", "<leader>t", [[:TroubleToggle<CR>]])
end

return M
