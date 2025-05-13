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

			local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = grpid,
				pattern = "gruvbox-material",
				callback = function()
					local function hl_lnk(src, trgt)
						vim.api.nvim_set_hl(0, src, { link = trgt })
					end

					local config = vim.fn["gruvbox_material#get_configuration"]()
					local palette = vim.fn["gruvbox_material#get_palette"](
						config.background,
						config.foreground,
						config.colors_override
					)
					local set_hl = vim.fn["gruvbox_material#highlight"]

					set_hl("MatchParen", palette.orange, palette.bg4)
					set_hl("CursorLineNr", palette.orange, palette.bg2)

					hl_lnk("@tag.attribute", "Blue")
					hl_lnk("@string", "Green")
					hl_lnk("@constant.builtin.go", "Purple")
				end,
			})
		end,
	},
}
