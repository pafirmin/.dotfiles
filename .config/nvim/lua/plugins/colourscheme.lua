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
		enabled = false,
		priority = 1000,
		opts = {
			italics = true,
		},
		config = function(_, opts)
			require("everforest").setup(opts)

			vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = true,
		opts = {
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "soft", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)

			vim.cmd("colorscheme gruvbox")
		end,
	},
}
