return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        commit = "16a51977dcaab1e1adc3152471ac862202f9be83",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "python",
                    "rust",
                    "cuda",
                    "dockerfile",
                    "go",
                    "sql",
                    "r",
                    "bash",
                    "bibtex",
                    "latex",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                sync_install = false,
                autotag = { enable = true },
                indent = { enable = true },
                rainbow = {
                    enable = true,
                    disable = { "html" },
                    extended_mode = false,
                    max_file_lines = nil,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
            })
        end,
    },
}
