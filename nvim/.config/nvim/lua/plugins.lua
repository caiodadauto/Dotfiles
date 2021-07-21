local packer = require('packer')
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]
return packer.startup(
    function() 
        use {'wbthomason/packer.nvim'}

        -- Productivity
        use {'tpope/vim-repeat'}
        use {'tpope/vim-surround'}
        use {'airblade/vim-rooter'}
        use {'farmergreg/vim-lastplace'}
        use {'windwp/nvim-projectconfig'}
        use {'untitled-ai/jupyter_ascending.vim'}
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('conf_blankline').config()
            end
         }
        use { 'windwp/nvim-autopairs',
            config = function()
                require('nvim-autopairs').setup()
            end
        }

        -- Git
        use {
            'lewis6991/gitsigns.nvim',
            config = function() -- FIXME: Create conf file
                require('gitsigns').setup({
                    signs = {
                        add = {
                            hl = "GitSignsAdd",
                            text = "▎",
                            numhl = "GitSignsAddNr",
                            linehl = "GitSignsAddLn",
                        },
                        change = {
                            hl = "GitSignsChange",
                            text = "▎",
                            numhl = "GitSignsChangeNr",
                            linehl = "GitSignsChangeLn",
                        },
                        delete = {
                            hl = "GitSignsDelete",
                            text = "▎",
                            numhl = "GitSignsDeleteNr",
                            linehl = "GitSignsDeleteLn",
                        },
                        topdelete = {
                            hl = "GitSignsDelete",
                            text = "▎",
                            numhl = "GitSignsDeleteNr",
                            linehl = "GitSignsDeleteLn",
                        },
                        changedelete = {
                            hl = "GitSignsChange",
                            text = "▎",
                            numhl = "GitSignsChangeNr",
                            linehl = "GitSignsChangeLn",
                        }
                    }
                })
            end
        }

        -- Style
        use {'ryanoasis/vim-devicons'}
        -- use {'sainnhe/gruvbox-material'}
        use {'ChristianChiarulli/nvcode-color-schemes.vim'}
        use {
            'norcalli/nvim-colorizer.lua',
            config = function() -- FIXME: Create conf file
                require('colorizer').setup()
            end
        }
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true},
            config = function()
                require('conf_lualine').config()
            end
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
        }
        use {
            'glepnir/dashboard-nvim',
            config = function()
                require('conf_dashboard').config()
            end
        }

        -- Language Server
        use {
            'neovim/nvim-lspconfig',
            config = function()
                require('conf_lsp').config()
            end
        }
        use {
            'hrsh7th/nvim-compe',
            config = function()
                require('conf_compe').config()
            end,
            requires = {
                "L3MON4D3/LuaSnip",
                "rafamadriz/friendly-snippets"
            }
        }
        use {
            "folke/trouble.nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
        }
        use {
            'mhartington/formatter.nvim',
            config = function()
                require('conf_formatter').config()
            end
        }

        -- Finder
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'},
                {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
            },
            config = function()
                require('conf_telescope').config()
            end
        }
    end
)
