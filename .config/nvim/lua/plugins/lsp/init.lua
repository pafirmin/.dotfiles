local servers = {
  "ts_ls",
  "html",
  "cssls",
  "lua_ls",
  "pyright",
  "jsonls",
  "yamlls",
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
        -- default handler
        function(server_name)
          local ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server_name)
          if ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
          end
          lspconfig[server_name].setup(opts)
        end,
        --noop: handled by typescript-tools.nvim
        ["ts_ls"] = function() end,
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    lazy = true,
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,
      settings = {
        expose_as_code_action = "all",
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
        tsserver_file_preferences = {
          importModuleSpecifierPreference = 'non-relative',
        }
      },
    },
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
  },
  -- {
  -- 	"nvimtools/none-ls.nvim",
  --    dependencies = { "nvimtools/none-ls-extras.nvim"},
  -- 	lazy = true,
  -- 	event = { "BufReadPre", "BufNewFile" },
  -- 	opts = {
  -- 		debug = false,
  -- 	},
  -- 	config = function(_, opts)
  -- 		local null_ls = require("null-ls")
  -- 		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  -- 		local formatting = null_ls.builtins.formatting
  -- 		local diagnostics = null_ls.builtins.diagnostics
  --
  -- 		opts.sources = {
  -- 			formatting.prettierd,
  -- 			formatting.black.with({ extra_args = { "--line-length=120" } }),
  -- 			formatting.stylua,
  -- 			formatting.goimports,
  -- 			formatting.yamlfmt,
  -- 			diagnostics.cfn_lint,
  --        require("none-ls.diagnostics.eslint_d"),
  -- 		}
  --
  -- 		null_ls.setup(opts)
  -- 	end,
  -- },
}
