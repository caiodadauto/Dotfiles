local M = {}

M.config = function()
    require("nnn").setup()
    keymap("n", "<leader>N", [[: NnnPicker<CR>]])
end

return M
