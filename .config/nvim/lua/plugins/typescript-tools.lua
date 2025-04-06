return {
  {
    "pmizio/typescript-tools.nvim",
    lazy = true,
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "blink.cmp" },
    config = function()
      local opts = {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
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
}
