local utils = require("utils")

local function configure_diagnostics()
	--- @class vim.diagnostic.Opts
	local config = {
		virtual_lines = {
			current_line = true,
		},
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
			},
			numhl = {
				[vim.diagnostic.severity.INFO] = "InfoMessage",
				[vim.diagnostic.severity.WARN] = "WarningMsg",
				[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			},
		},
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = true,
		},
	}

	vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
	utils.set_keymap({
		desc = "show documentation for symbol under cursor",
		key = "K",
		cmd = function()
			vim.lsp.buf.hover({ border = "rounded" })
		end,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "go to definition of symbol under cursor",
		key = "gd",
		cmd = vim.lsp.buf.definition,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "go to type definition of symbol under cursor",
		key = "gD",
		cmd = vim.lsp.buf.type_definition,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "list references to symbol under cursor in quickfix list",
		key = "gr",
		cmd = vim.lsp.buf.references,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "rename symbol under cursor",
		key = "<leader>rn",
		cmd = vim.lsp.buf.rename,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "perform code action",
		mode = { "n", "v" },
		key = "<leader>ca",
		cmd = vim.lsp.buf.code_action,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "open diagnostics for current line in floating window",
		key = "<leader><leader>",
		cmd = vim.diagnostic.open_float,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "go to next diagnostic",
		key = "<leader>n",
		cmd = function()
			vim.diagnostic.jump({ count = 1, float = true })
		end,
		bufnr = bufnr,
	})

	utils.set_keymap({
		desc = "go to prev diagnostic",
		key = "<leader>p",
		cmd = function()
			vim.diagnostic.jump({ count = -1, float = true })
		end,
		bufnr = bufnr,
	})
end

local function create_user_commands()
	vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", { nargs = 0 })

	vim.api.nvim_create_user_command("LspLog", function()
		vim.cmd("tabnew " .. vim.lsp.get_log_path())
	end, { nargs = 0 })
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("global.lsp", { clear = true }),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		client.server_capabilities.semanticTokensProvider = nil

		lsp_keymaps(args.buf)
		configure_diagnostics()
		create_user_commands()
	end,
})

local server_names = {}
local lsp_config_path = vim.fn.stdpath("config") .. "/lsp"

for _, file in ipairs(vim.fn.readdir(lsp_config_path)) do
	local server_name = file:gsub("%.lua$", "")
	table.insert(server_names, server_name)
end

vim.lsp.enable(server_names)
