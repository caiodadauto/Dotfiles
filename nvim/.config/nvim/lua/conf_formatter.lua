local M = {}

M.config = function()
    formatter = require("formatter")

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
            args = { "--quiet", "-" },
            stdin = true,
        }
    end
    local clangformat = function()
        return {
            exe = "clang-format",
            args = { [[-style="{BasedOnStyle: Mozilla, IndentWidth: 4,TabWidth: 4}"]] },
            stdin = true,
            cwd = vim.fn.expand("%:p:h"),
        }
    end
    local stylua = function()
        return {
            exe = "stylua",
            args = {
                "--config-path " .. os.getenv("XDG_CONFIG_HOME") .. "/stylua/stylua.toml",
                "-",
            },
            stdin = true,
        }
    end
    local indentlatex = function()
        return {
            exe = "latexindent.pl",
            args = { "-m"},
            stdin = true,
        }
    end

    formatter.setup({
        logging = false,
        filetype = { python = { black }, cpp = { clangformat }, lua = { stylua }, tex = { indentlatex } },
    })

    keymap("n", "<leader>F", [[: Format<CR>]])
end

return M
