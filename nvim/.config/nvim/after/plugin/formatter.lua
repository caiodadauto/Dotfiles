local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local formatter = require("formatter")
local util = require("formatter.util")

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
        exe = "latexindent",
        args = { "-m" },
        stdin = true,
    }
end

formatter.setup({
    logging = false,
    filetype = {
        python = { black },
        lua = { stylua },
        cpp = { clangformat },
        tex = { indentlatex },
    },
})

keymap.set("n", "<leader>F", "<cmd>Format<CR>", opts)
