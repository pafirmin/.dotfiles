local servers = {
	"tsserver",
	"gopls",
	"html",
	"cssls",
	"lua_ls",
	"pyright",
	"jsonls",
	"emmet_ls",
	"clojure_lsp",
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

			local opts = {
				on_attach = handlers.on_attach,
				capabilities = handlers.capabilities,
			}

			mason_lspconfig.setup_handlers({
				function(server_name)
					local ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server_name)
					if ok then
						opts = vim.tbl_deep_extend("force", conf_opts, opts)
					end
					lspconfig[server_name].setup(opts)
				end,
				["tsserver"] = function()
					--noop: handled by typescript-tools.nvim
				end,
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		lazy = true,
		ft = { "typescript", "typescriptreact" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			on_attach = require("plugins.lsp.handlers").on_attach,
			capabilities = require("plugins.lsp.handlers").capabilities,
			settings = {
				expose_as_code_action = "all",
				tsserver_plugins = {
					"@styled/typescript-styled-plugin",
				},
			},
		},
		config = function(_, opts)
			require("typescript-tools").setup(opts)
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
		"nvimtools/none-ls.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			debug = false,
		},
		config = function(_, opts)
			local null_ls = require("null-ls")
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			opts.sources = {
				formatting.prettierd.with({ extra_filetypes = { "astro" } }),
				formatting.black.with({ extra_args = { "--line-length=120" } }),
				formatting.stylua,
				formatting.goimports,
				formatting.yamlfmt,
				diagnostics.cfn_lint,
			}

			null_ls.setup(opts)
		end,
	},
}
