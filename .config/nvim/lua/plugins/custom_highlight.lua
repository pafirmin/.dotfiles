-----------------------------------[
-- cusotm highlights for diagnostics
-----------------------------------]

local M = {
	lazy = true,
	event = "VeryLazy",
	"kasama/nvim-custom-diagnostic-highlight",
	opts = {
		register_handler = true, -- Wether to register the handler automatically
		handler_name = "kasama/nvim-custom-diagnostic-highlight", -- The name of the handler to be registered (has no effect if register_handler = false)
		highlight_group = "Conceal", -- The Highlight group to set at the diagnostic
		patterns_override = { -- Lua patterns to be tested against the diagnostic message. Overrides default behavior
			"%sunused",
			"^unused",
			"not used",
			"never used",
			"not read",
			"never read",
			"empty block",
		},
		extra_patterns = {}, -- Extra lua patterns to add. Does NOT override and will be added to the above
		diagnostic_handler_namespace = "unused_hl_ns", -- Name of the handler namespace that will contain the highlight (needs to be unique)
		defer_until_n_lines_away = false, -- If set to a number, then highlighting is deferred until the cursor is N lines away from
		-- diagnostics. Useful to avoid unwanted highlights in the currently edited position.
		defer_highlight_update_events = { "InsertLeave" }, -- Events on which deferred highlights will be updated (passed to nvim_create_autocmd)
	},
}

return M
