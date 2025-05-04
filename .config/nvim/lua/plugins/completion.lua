local M = {
	{
		"saghen/blink.cmp",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-autopairs", "L3MON4D3/LuaSnip" },
		version = "v0.*",
		opts = {
			snippets = {
				preset = "luasnip",
			},
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
				menu = {
					draw = {
						components = {
							label = {
								width = { fill = true },
							},
						},
						columns = {
							{ "kind_icon", "label", "label_description", "source_name", gap = 1 },
						},
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lsp = { score_offset = 2 },
				},
			},
		},
	},

	-----------------------------------------[
	-- Snippet engine
	-----------------------------------------]
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		version = "v2.*",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/" } })
		end,
	},
}

return M
