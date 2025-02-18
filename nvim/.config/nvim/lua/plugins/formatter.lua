return {
    {
        "mhartington/formatter.nvim",
        opts = function()
            local black = function()
                return {
                    exe = "black",
                    args = { "--quiet", "-" },
                    stdin = true,
                }
            end

            local isort = function()
                return {
                    exe = "isort",
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

            return {
                logging = false,
                filetype = {
                    python = { black, isort },
                    lua = { stylua },
                    cpp = { clangformat },
                    tex = { indentlatex },
                },
            }
        end,
    },
}
