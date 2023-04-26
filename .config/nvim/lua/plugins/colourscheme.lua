return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		enabled = false,
		opts = {
			options = {
				styles = {
					keywords = "italic",
				},
			},
			groups = {
				nordfox = {
					["@boolean"] = { tg = "palette.orange.bright" },
					["@constant.builtin"] = { fg = "palette.red", style = "NONE" },
					["@type.builtin"] = { fg = "palette.yellow" },
					["@keyword"] = { fg = "palette.pink.bright" },
					["@keyword.function"] = { fg = "palette.pink.bright" },
					["@keyword.operator"] = { fg = "palette.orange.bright" },
					["@keyword.return"] = { style = "bold" },
					["@operator"] = { fg = "palette.orange.bright" },
					["@type.qualifier"] = { fg = "palette.magenta.bright" },
					["@tag"] = { fg = "palette.red.bright", style = "NONE" },
				},
			},
		},
		config = function(_, opts)
			require("nightfox").setup(opts)

			vim.cmd("colorscheme nordfox")
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		enabled = true,
		priority = 1000,
		opts = {
			italics = true,
		},
		config = function(_, opts)
			require("everforest").setup(opts)

			vim.cmd([[colorscheme everforest]])
		end,
	},
}
