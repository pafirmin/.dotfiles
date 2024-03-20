local M = {
	"ray-x/go.nvim",
	lazy = true,
	ft = { "go", "gomod" },
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		run_in_floaterm = true,
		diagnostic = {
			virtual_text = false,
		},
	},
	config = function(_, opts)
		require("go").setup(opts)
	end,
}

return M
