--- @class vim.lsp.ClientConfig
local config = {
  cmd = { "gopls", "--stdio" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
}

return config
