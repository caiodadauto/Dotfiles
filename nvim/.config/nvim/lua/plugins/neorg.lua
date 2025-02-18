return {
    {
        "nvim-neorg/neorg",
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
            },
        },
    },
}
