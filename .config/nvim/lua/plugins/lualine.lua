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
			refresh = {
				statusline = 10,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = {
				{ "filename", path = 1 },
			},
			lualine_x = { "filetype" },
			lualine_y = { "progress" },
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
		vim.o.laststatus = 3
	end,
}

return M
