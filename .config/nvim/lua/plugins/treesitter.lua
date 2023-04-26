----------------------[
-- syntax highlighting
----------------------]

local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/playground" },
	opts = {
		ensure_installed = "all",
		sync_install = false,
		ignore_install = { "" }, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = false,
		},
		autotag = { enable = true },
		autopairs = { enable = true },
		indent = { enable = true, disable = { "yaml" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
			config = {
				typescript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_fragment = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

return M
