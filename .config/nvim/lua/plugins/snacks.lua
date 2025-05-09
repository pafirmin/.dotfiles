-------------------------------[
-- Pickers, dashboard and utils
-------------------------------]
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = {
			enabled = true,
			theme = {
				selectedLineBgColor = { fg = "Substitute" },
			},
		},
		images = {
			enabled = true,
		},
		picker = {
			ui_select = true,
		},
		dashboard = {
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 2 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
				{ section = "startup" },
			},
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{ icon = " ", key = "e", desc = "File explorer", action = ":lua Snacks.explorer()" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
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
			"g/",
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
			desc = "open quick fix list",
			"<leader>qf",
			function()
				require("snacks").picker.qflist()
			end,
		},
		{
			desc = "open file explorer",
			"|",
			function()
				require("snacks").explorer()
			end,
		},
		{
			desc = "open buffer list",
			"<leader>bb",
			function()
				require("snacks").picker.buffers()
			end,
		},
		{
			desc = "show git blame of line",
			"<leader>bl",
			function()
				require("snacks").git.blame_line()
			end,
		},
	},
}
