--------------------------------[
-- Colorschemes
--------------------------------]

return {
	{ "savq/melange-nvim" },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_dim_inactive_windows = 1

			local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = grpid,
				pattern = "gruvbox-material",
				callback = function()
					local function hl_lnk(src, trgt)
						vim.api.nvim_set_hl(0, src, { link = trgt })
					end

					hl_lnk("@tag.attribute", "Blue")
					hl_lnk("@string", "Green")
				end,
			})
		end,
	},
}
