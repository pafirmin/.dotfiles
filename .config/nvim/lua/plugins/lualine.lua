-------------[
-- status bar
-------------]

local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = "true",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = {
        { 'filename', path = 1 }
      },
      lualine_x = {},
      lualine_y = { 'progress' },
    },
  },
}

return M
