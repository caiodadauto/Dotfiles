return {
    { "akinsho/git-conflict.nvim", opts = {} },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
        opts = { enhanced_diff_hl = true },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            local git_char = "│"
            return {
                signs = {
                    add = { text = git_char },
                    change = { text = git_char },
                    delete = { text = git_char },
                    topdelete = { text = git_char },
                    changedelete = { text = git_char },
                    untracked = { text = git_char },
                },
                signcolumn = true,
                numhl = false,
            }
        end,
    },
}
