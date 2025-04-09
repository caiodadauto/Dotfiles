return {
    -- {
    --     "nvim-neorg/neorg",
    --     lazy = false,
    --     version = "*",
    --     config = function()
    --         require("neorg").setup({
    --             load = {
    --                 ["core.defaults"] = {},
    --                 ["core.concealer"] = {},
    --                 ["core.dirman"] = {
    --                     config = {
    --                         workspaces = {
    --                             phd = "~/Documents/gold/phd/notes/",
    --                             notes = "~/Documents/gold/notes/",
    --                         },
    --                         default_workspace = "notes",
    --                     },
    --                 },
    --             },
    --         })
    --         vim.wo.foldlevel = 99
    --         vim.wo.conceallevel = 2
    --     end,
    -- },
    -- {
    --     {
    --         "3rd/image.nvim",
    --         lazy = false,
    --         opts = {},
    --     },
    -- },
    {
        "nvim-neorg/neorg",
        -- dependencies = { "nvim-treesitter", "3rd/image.nvim" },
        dependencies = { "nvim-treesitter" },
        lazy = false,
        version = "v9.2.0",
        build = ":Neorg sync-parsers",
        priority = 30,
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            phd = "~/Documents/gold/phd/notes/",
                            notes = "~/Documents/gold/notes/",
                        },
                        default_workspace = "notes",
                    },
                },
                ["core.export"] = {
                    export_dir = "~/Downloads/",
                },
                -- ["core.latex.renderer"] = {},
                -- ["core.integrations.image"] = {},
            },
        },
    },
}
