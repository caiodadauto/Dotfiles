return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                opts = {
                    ensure_installed = {
                        "stylua",
                        "black",
                        "clang-format",
                        "latexindent",
                        "isort",
                    },
                },
            },
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "rust_analyzer",
            },
        },
    },
}
