return {
    { "williamboman/mason.nvim", version = "v1.11.0", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "v1.32.0",
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
