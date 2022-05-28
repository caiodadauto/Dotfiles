local M = {}

M.config = function()
    require("mini.surround").setup()
    require("mini.comment").setup()
    require("mini.cursorword").setup()
    require("mini.trailspace").setup()
    keymap("n", "<leader>mt", "<cmd>lua MiniTrailspace.trim()<CR>", opts)
end

return M
