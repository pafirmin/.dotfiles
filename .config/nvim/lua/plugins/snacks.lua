return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = {
			enabled = true,
		},
		picker = {
			ui_select = true,
		},
		explorer = {
			replace_netrw = true,
		},
	},
	keys = {
		{
			desc = "open lazygit in floating window",
			"<leader>gg",
			function()
				require("snacks").lazygit.open()
			end,
		},
		{
			desc = "grep over project",
			"<leader>/",
			function()
				require("snacks").picker.grep()
			end,
		},
		{
			desc = "open file finder",
			"\\",
			function()
				require("snacks").picker.files()
			end,
		},
		{
			desc = "open file explorer",
			"|",
			function()
				require("snacks").explorer()
			end,
		},
	},
}
