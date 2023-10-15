return {
	{ "fatih/vim-go", lazy = true, ft = "go" }, -- GoLang utils
	{ "nvim-lua/plenary.nvim", lazy = true }, -- window utils, used by other plugins
	{ "tpope/vim-fugitive" }, -- use git from inside nvim
	{ "tpope/vim-repeat" }, -- repeat plugin-specific commands with '.'
	{ "tpope/vim-surround" }, -- keymaps for surrounding text
	{ "tpope/vim-speeddating" }, -- easily change dates
	{ "kevinhwang91/nvim-bqf" }, -- better quickfix menu
	{ "Olical/conjure", lazy = true, ft = "clojure" },
	{
		"alexghergh/nvim-tmux-navigation", -- navigate between tmux panes and vim windows
		opts = {
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
				next = "<C-Space>",
			},
		},
		config = function(_, opts)
			require("nvim-tmux-navigation").setup(opts)
		end,
	},
	{
		"aserowy/tmux.nvim",
		enabled = false,
		config = function()
			return require("tmux").setup({ copy_sync = { enabled = false } })
		end,
	},
	{
		"L3MON4D3/LuaSnip", -- snippet engine
		lazy = true,
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/" } })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- show verticle lines at indents
		-- enabled = false,
		main = "ibl",
		opts = { scope = { show_start = false, show_end = false } },
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag", -- auto-close html/jsx tags
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
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		ft = "markdown",
		cmd = "MarkdownPreview",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
