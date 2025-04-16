return {
	{ "tpope/vim-repeat" }, -- repeat plugin-specific commands with '.'
	{ "tpope/vim-surround" }, -- keymaps for surrounding text
	{ "tpope/vim-abolish" }, -- powerful substitution tools
	{ "tpope/vim-unimpaired" }, -- useful keymappings (https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt)
	{ "mbbill/undotree", lazy = true }, -- <leader>u to view undo tree
	{ "nvim-lua/plenary.nvim", lazy = true }, -- window utils, used by other plugins

	-----------------------------------------[
	-- Seemlessly navigate between vim windows
	-- and tmux panes
	-----------------------------------------]
	{
		"alexghergh/nvim-tmux-navigation",
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
	},

	-----------------------------------------[
	-- Session persistence/restore
	-----------------------------------------]
	{
		"folke/persistence.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	-----------------------------------------[
	-- Context (JSX) aware comments
	-----------------------------------------]
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},

	-----------------------------------------[
	-- Snippet engine
	-----------------------------------------]
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		version = "v2.*",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/" } })
		end,
	},

	-----------------------------------------[
	-- Mark indent levels with vertical lines
	-----------------------------------------]
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			scope = {
				show_start = false,
				show_end = false,
			},
			indent = {
				char = { "│" },
			},
		},
	},

	------------------------------------------[
	-- Automatically close and match html tags
	------------------------------------------]
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = { "html", "typescriptreact", "javascriptreact" },
		config = true,
	},

	-----------------------------------[
	-- Easily jump around files
	-----------------------------------]
	{
		"ggandor/leap.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "X", "<Plug>(leap-backward-to)")
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
		end,
	},

	-----------------------------------[
	-- Preview markdown files in browser
	-----------------------------------]
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		ft = "markdown",
		cmd = "MarkdownPreview",
		build = ":call mkdp#util#install()",
	},
}
