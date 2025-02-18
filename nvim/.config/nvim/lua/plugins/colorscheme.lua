return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
    },
}
