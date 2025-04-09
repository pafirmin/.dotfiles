local utils = require("utils")

local inlayHints = {
	includeInlayParameterNameHints = "all",
	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayVariableTypeHints = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayEnumMemberValueHints = true,
}

local function set_typescript_keymaps(client, bufnr)
	-- Organize Imports
	utils.set_keymap({
		key = "<leader>io",
		cmd = function()
			client:exec_cmd({
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(bufnr) },
			})
		end,
		desc = "Organize Imports",
		bufnr = bufnr,
	})

	-- Remove Unused Imports
	utils.set_keymap({
		key = "<leader>ir",
		cmd = function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					diagnostics = {},
					---@diagnostic disable-next-line: assign-type-mismatch
					only = { "source.removeUnusedImports.ts" },
				},
			})
		end,
		desc = "Remove Unused Imports",
		bufnr = bufnr,
	})

	-- Add Missing Imports
	utils.set_keymap({
		key = "<leader>ia",
		cmd = function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					diagnostics = {},
					---@diagnostic disable-next-line: assign-type-mismatch
					only = { "source.addMissingImports.ts" },
				},
			})
		end,
		desc = "Add Missing Imports",
		bufnr = bufnr,
	})
end

--- @class vim.lsp.ClientConfig
local config = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
	on_attach = function(client, bufnr)
		set_typescript_keymaps(client, bufnr)
	end,
	settings = {
		typescript = {
			inlayHints = inlayHints,
		},
		javascript = {
			inlayHints = inlayHints,
		},
	},
	init_options = {
		hostInfo = "neovim",
		preferences = {
			includeCompletionsForModuleExports = true,
			includeCompletionsForImportStatements = true,
			importModuleSpecifierPreference = "non-relative",
		},
	},
}

return config
