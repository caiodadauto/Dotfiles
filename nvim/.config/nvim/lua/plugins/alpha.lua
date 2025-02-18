return {
    {
        "goolord/alpha-nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        opts = function()
            local fortune = require("alpha.fortune")
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }
            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("s", "  Settings", ":NnnPicker $HOME/.config/nvim/<CR>"),
                dashboard.button("q", "󰅙  Quit NVIM", ":qa<CR>"),
            }
            dashboard.section.footer.val = fortune()
            return dashboard
        end,
        config = function(_, dashboard)
            require("alpha").setup(dashboard.opts)
            -- Disable folding on alpha buffer
            vim.cmd([[
                autocmd FileType alpha setlocal nofoldenable
            ]])
        end,
    },
}
