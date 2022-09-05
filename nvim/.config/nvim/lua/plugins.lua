local packer = require("packer")
cmd([[ autocmd BufWritePost plugins.lua PackerCompile ]])
return packer.startup(function()
    use({ "wbthomason/packer.nvim" })

    -- Core
    use({ "jghauser/mkdir.nvim" })
    use({ "farmergreg/vim-lastplace" })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("conf_autopairs").config()
        end,
    })
    use({
        "echasnovski/mini.nvim",
        branch = "stable",
        config = function()
            require("conf_mini").config()
        end,
    })
    use({
        "luukvbaal/nnn.nvim",
        config = function()
            require("conf_nnn").config()
        end,
    })

    -- Jupyter
    use({ "untitled-ai/jupyter_ascending.vim" })

    -- Projects
    use({ "windwp/nvim-projectconfig" })
    use({
        "ahmedkhalf/project.nvim",
        config = function()
            require("conf_project_nvim").config()
        end,
    })

    -- Style
    -- use({ "shaunsingh/nord.nvim" })
    -- use({ "sainnhe/gruvbox-material" })
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup()
        end,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("conf_alpha").config()
        end,
    })
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("conf_trouble").config()
        end,
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("conf_blankline").config()
        end,
    })
    use({
        "hoob3rt/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("conf_lualine").config()
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use({
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup()
        end,
    })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    })
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
    use({
        "akinsho/git-conflict.nvim",
        config = function()
            require("git-conflict").setup()
        end,
    })

    -- Language Server
    use({
        "ms-jpq/coq_nvim",
        branch = "coq",
        config = function()
            require("conf_coq").config()
        end,
    })
    use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("conf_lsp").config()
        end,
    })
    use({
        "mhartington/formatter.nvim",
        config = function()
            require("conf_formatter").config()
        end,
    })

    -- Finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = function()
            require("conf_telescope").config()
        end,
    })
end)
