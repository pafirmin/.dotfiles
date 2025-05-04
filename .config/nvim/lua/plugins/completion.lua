-----------------[
-- Autocompletion
-----------------]

local M = {
	"saghen/blink.cmp",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-autopairs" },
	version = "v0.*",
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = { border = "single" },
			},
			list = {
				selection = { preselect = false },
			},
			trigger = { show_in_snippet = false },
			accept = {
				auto_brackets = { enabled = true },
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = { score_offset = 2 },
			},
		},
	},
}

return M
