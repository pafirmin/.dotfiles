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
			vim.g.gruvbox_material_enable_italic = 1
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
					set_hl("@tag.attribute", palette.fg1, palette.none, "italic")

					hl_lnk("@variable.member", "Normal")
					hl_lnk("@property", "Normal")
					hl_lnk("@function", "Normal")
					hl_lnk("@function.call", "Normal")
					hl_lnk("@function.method", "Normal")
					hl_lnk("@function.method.call", "Normal")
					hl_lnk("@string", "GreenItalic")
					hl_lnk("@constant.builtin.go", "Purple")
					hl_lnk("@constant.builtin", "Purple")
					hl_lnk("@keyword", "Red")
					hl_lnk("@type", "Yellow")
					hl_lnk("@type.builtin", "Yellow")
					set_hl("@punctuation.bracket", palette.grey2, palette.none)
					set_hl("@constructor.lua", palette.grey2, palette.none)
				end,
			})
		end,
	},
}
