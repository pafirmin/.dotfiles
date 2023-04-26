return {
	{ "fatih/vim-go", lazy = true, ft = "go" }, -- GoLang utils
	{ "nvim-lua/plenary.nvim", lazy = true }, -- window utils, used by other plugins
	{ "tpope/vim-fugitive" }, -- use git from inside nvim
	{ "tpope/vim-repeat" }, -- repeat plugin-specific commands with '.'
	{ "tpope/vim-surround" }, -- keymaps for surrounding text
	{ "tpope/vim-speeddating" }, -- easily change dates
	{
		"aserowy/tmux.nvim", -- seemless tmux window switching/resizing
		config = function()
			require("tmux").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip", -- snippet engine
		lazy = true,
		dependencies = { "rafamadriz/friendly-snippets" }, -- lots of snippets
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- show horizontal lines at indents
		config = function()
			require("indent_blankline").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag", -- auto-close html/jsx tags
		lazy = true,
		event = "InsertEnter",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"ggandor/leap.nvim", -- easily jump around files
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("leap").add_default_mappings()
		end,
	},
}
