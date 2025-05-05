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
				statusline = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diagnostics",
				{
					"macro",
					fmt = function()
						local reg = vim.fn.reg_recording()
						if reg ~= "" then
							return "Recording @" .. reg
						end
						return nil
					end,
					color = { fg = "#ff9e64" },
					draw_empty = false,
				},
			},
			lualine_c = {
				{
					"filename",
					path = 1,
					shorting_target = 0,
				},
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
