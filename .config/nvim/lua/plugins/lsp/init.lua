local servers = {
	"tsserver",
	"gopls",
	"html",
	"cssls",
	"lua_ls",
	"pyright",
	"jsonls",
	"emmet_ls",
}

local mason_packages = {
	"prettierd",
	"eslint_d",
}

return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/typescript.nvim",
			"williamboman/mason.nvim",
		},
		config = function(_, _)
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local handlers = require("plugins.lsp.handlers")
			handlers.setup()

			mason_lspconfig.setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					local opts = {
						on_attach = handlers.on_attach,
						capabilities = handlers.capabilities,
					}
					local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server_name)
					if require_ok then
						opts = vim.tbl_deep_extend("force", conf_opts, opts)
					end
					lspconfig[server_name].setup(opts)
				end,
				["tsserver"] = function()
					require("typescript").setup({
						server = {
							on_attach = handlers.on_attach,
							capabilities = handlers.capabilities,
						},
					})
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = "Mason",
		opts = {
			ui = {
				border = "none",
				icons = {
					package_installed = "◍",
					package_pending = "◍",
					package_uninstalled = "◍",
				},
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")

			local function ensure_installed()
				for _, package in ipairs(mason_packages) do
					local p = mr.get_package(package)
					if not p:is_installed() then
						p:install()
					end
				end
			end

			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "jose-elias-alvarez/typescript.nvim" },
		opts = {
			debug = false,
		},
		config = function(_, opts)
			local null_ls = require("null-ls")
			local ts_actions = require("typescript.extensions.null-ls.code-actions")
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			local code_actions = null_ls.builtins.code_actions
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			opts.sources = {
				ts_actions,
				formatting.prettierd,
				formatting.stylua,
				formatting.gofmt,
				code_actions.eslint_d,
				diagnostics.jsonlint.with({ filetypes = { "json", "jsonc" } }),
				diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
					end,
				}),
			}

			null_ls.setup(opts)
		end,
	},
}
