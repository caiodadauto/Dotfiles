local M = {}

M.config = function()
    formatter = require('formatter')

    local texpretty = function()
        return {
            exe = "texpty",
            args = {"--no-comment-banner"},
            stdin = true,
            ignore_exitcode = true
        }
    end
    local black = function()
        return {
            exe = "black",
            args = {"--quiet", "-"},
            stdin = true
        }
    end
    local clangformat = function()
        return {
            exe = "clang-format",
            args = {[[-style="{BasedOnStyle: Mozilla, IndentWidth: 4,TabWidth: 4}"]]},
            stdin = true,
            cwd = vim.fn.expand('%:p:h')
        }
    end

    formatter.setup({
        logging = false,
        filetype = { python = { black }, cpp = { clangformat }, tex = { texpretty } }
    })

    keymap('n', '<leader>F', [[: Format<CR>]])
end

return M
