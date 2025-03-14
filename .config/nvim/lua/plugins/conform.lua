return {
  'stevearc/conform.nvim', -- formatters
  opts = {
    lazy = true,
    ft = { "typescript", "typescriptreact", "javascriptreact" },
    formatters_by_ft = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "first",
    },
  },
}
