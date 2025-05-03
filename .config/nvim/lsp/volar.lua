local function get_typescript_server_path(root_dir)
	vim.inspect(root_dir)
	local project_root = vim.fs.dirname(vim.fs.find("node_modules", { path = root_dir, upward = true })[1])
	return project_root and (project_root .. "/node_modules/typescript/lib") or ""
end

-- https://github.com/vuejs/language-tools/blob/master/packages/language-server/lib/types.ts
local volar_init_options = {
	typescript = {
		tsdk = "",
	},
}

return {
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
	init_options = {
		vue = {
			hybridMode = false,
		},

		typescript = {
			tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
		},
	},
}
