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
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "saghen/blink.cmp",
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
        -- default handler
        function(server_name)
          local opts = {
            capabilities = handlers.capabilities,
            on_attach    = handlers.on_attach,
          }

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
    config = function()
      local opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
        settings = {
          tsserver_file_preferences = {
            importModuleSpecifierPreference = 'non-relative',
          },
        },
      }

      vim.api.nvim_buf_set_keymap(0,
        'n',
        '<leader>ia',
        "<cmd>TSToolsAddMissingImports<CR>",
        { noremap = true }
      )

      vim.api.nvim_buf_set_keymap(0,
        'n',
        '<leader>io',
        "<cmd>TSToolsOrganizeImports<CR>",
        { noremap = true }
      )

      require("typescript-tools").setup(opts);
    end
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
}
