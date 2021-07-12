local M = {}

M.config = function()
    formatter = require('formatter')

    local black = function()
        return {
            exe = "black",
            args = {"--quiet", "-"},
            stdin = true
        }
    end

    formatter.setup({
        logging = false,
        filetype = { python = { black } }
    })

    keymap('n', '<leader>F', [[: Format<CR>]])
end

return M
