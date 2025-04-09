-----------------[
-- formatting
-----------------]

return {
	"stevearc/conform.nvim",
	opts = {
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		formatters_by_ft = {
			javascript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "first" },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true, lsp_format = "first" },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true, lsp_format = "first" },
			typescript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "first" },
			go = { "goimports", "gofmt" },
			lua = { "stylua", lsp_format = "fallback" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, range = range })
		end, { range = true })
	end,
}
