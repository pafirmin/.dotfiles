--- @class vim.lsp.ClientConfig
local config = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	single_file_support = true,
}

return config
