-------------[
-- status bar
-------------]

local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = "true",
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
		},
	},
}

return M
