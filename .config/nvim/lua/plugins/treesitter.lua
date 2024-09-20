----------------------[
-- syntax highlighting
----------------------]

local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/playground" },
		opts = {
			ensure_installed = "all",
			sync_install = false,
			ignore_install = { "" }, -- List of parsers to ignore installing
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},
			autotag = { enable = true, enable_close_on_slash = false },
			autopairs = { enable = true },
			indent = { enable = true, disable = { "yaml" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter",
		opts = {
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					goto_next_start = {
						["]a"] = "@parameter.inner",
						["]f"] = "@function.outer",
						["]c"] = "@class.inner",
					},
					goto_previous_start = {
						["[a"] = "@parameter.inner",
						["[f"] = "@function.outer",
						["[c"] = "@class.inner",
					},
				},
			},
		},
		config = function(_, opts)
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ "n", "x", "o" }, "-", ts_repeat_move.repeat_last_move_previous)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

return M
