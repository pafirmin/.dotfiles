local utils = require("utils")
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
			component_separators = { left = "|", right = "|" },
			theme = "auto",
			refresh = {
				statusline = 100,
			},
			disabled_filetypes = {
				winbar = { "snacks_dashboard" },
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
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
				{ "filename", path = 1, shorting_target = 0 },
				"searchcount",
			},
			lualine_x = {
				{
					"lsp_status",
					cond = function()
						return vim.o.columns > 90
					end,
				},
				"encoding",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					"filename",
					path = 1,
					cond = (function()
						local show = false
						vim.keymap.set("n", "yof", function()
							show = not show
						end)

						return function()
							return show
						end
					end)(),
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
		vim.o.laststatus = 3
	end,
}

return M
