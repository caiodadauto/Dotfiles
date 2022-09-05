local M = {}

M.config = function()
    local proj = require("nvim-projectconfig")
    proj.load_project_config()
end

return M
