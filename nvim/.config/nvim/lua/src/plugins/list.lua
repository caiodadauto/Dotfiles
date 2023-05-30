local packer_list = {
	"wbthomason/packer.nvim",
	-----------
	-- Utils --
	-----------
	"luukvbaal/nnn.nvim",
	"jghauser/mkdir.nvim",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"kylechui/nvim-surround",
	"ethanholz/nvim-lastplace",
	"ahmedkhalf/project.nvim",
    'mhartington/formatter.nvim',
	-----------
	-- Style --
	-----------
    { "catppuccin/nvim", as = "catppuccin" },
	"NvChad/nvim-colorizer.lua",
	"lukas-reineke/indent-blankline.nvim",
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	},
	{ "goolord/alpha-nvim", requires = "kyazdani42/nvim-web-devicons" },
	{ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } },
	---------
	-- Git --
	---------
	"lewis6991/gitsigns.nvim",
	"akinsho/git-conflict.nvim",
	{ "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" } },
	---------
	-- LSP --
	---------
	{ "williamboman/mason.nvim", run = ":MasonUpdate" },
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"onsails/lspkind.nvim",
	"simrat39/rust-tools.nvim",
	-----------
	-- Snips --
	-----------
	{ "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	---------
	-- CMP --
	---------
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"lukas-reineke/cmp-under-comparator",
	------------
	-- Finder --
	------------
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
	},
}

return packer_list
