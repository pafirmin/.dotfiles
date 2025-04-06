--------------------------------[
-- Colorschemes
--------------------------------]

return {
  {
    "neanias/everforest-nvim",
    priority = 1000,
    opts = {
      ---Whether italics should be used for keywords and more.
      italics = false,
      ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
      ---Default is "medium".
      background = "medium",
      ---How much of the background should be transparent. 2 will have more UI
      ---components be transparent (e.g. status line background)
      transparent_background_level = 0,
      ---Disable italic fonts for comments. Comments are in italics by default, set
      ---this to `true` to make them _not_ italic!
      disable_italic_comments = false,
      ---By default, the colour of the sign column background is the same as the as normal text
      ---background, but you can use a grey background by setting this to `"grey"`.
      sign_column_background = "none",
      ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
      ---`"low"` (default).
      ui_contrast = "low",
      ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
      ---
      ---When this option is used in conjunction with show_eob set to `false`, the
      ---end of the buffer will only be hidden inside the active window. Inside
      ---inactive windows, the end of buffer filler characters will be visible in
      ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
      dim_inactive_windows = true,
      ---Some plugins support highlighting error/warning/info/hint texts, by
      ---default these texts are only underlined, but you can use this option to
      ---also highlight the background of them.
      diagnostic_text_highlight = false,
      ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
      diagnostic_virtual_text = "coloured",
      ---Some plugins support highlighting error/warning/info/hint lines, but this
      ---feature is disabled by default in this colour scheme.
      diagnostic_line_highlight = false,
      ---By default, this color scheme won't colour the foreground of |spell|, instead
      ---colored under curls will be used. If you also want to colour the foreground,
      ---set this option to `true`.
      spell_foreground = false,
      ---Whether to show the EndOfBuffer highlight.
      show_eob = true,
      ---Style used to make floating windows stand out from other windows. `"bright"`
      ---makes the background of these windows lighter than |hl-Normal|, whereas
      ---`"dim"` makes it darker.
      ---
      ---Floating windows include for instance diagnostic pop-ups, scrollable
      ---documentation windows from completion engines, overlay windows from
      ---installers, etc.
      ---
      ---NB: This is only significant for dark backgrounds as the light palettes
      ---have the same colour for both values in the switch.
      float_style = "bright",
      ---Inlay hints are special markers that are displayed inline with the code to
      ---provide you with additional information. You can use this option to customize
      ---the background color of inlay hints.
      ---
      ---Options are `"none"` or `"dimmed"`.
      inlay_hints_background = "none",
      on_highlights = function(hl, palette)
        hl.TSTagAttribute = { fg = palette.blue, bg = palette.none }
        hl.TSString = { fg = palette.green, bg = palette.none }
        hl.TSFunctionCall = { fg = palette.aqua, bg = palette.none }
        hl.TSMethodCall = { fg = palette.aqua, bg = palette.none }
        hl.TSConstant = { fg = palette.purple, bg = palette.none }
        hl.typescriptTSInclude = { link = "Red" }
        hl.TSURI = { fg = palette.green, bg = palette.none, underline = true }
        hl.DiagnosticUnderlineError = { undercurl = true, sp = palette.red }
        hl.DiagnosticUnderlineWarn = { undercurl = true, sp = palette.yellow }
        hl.TSTitle = { bold = true }
      end
    },
    config = function(_, opts)
      require("everforest").setup(opts)
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = true,
      },
      invert_selection = false,
      strikethrough = true,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,    -- invert background for search, diffs, statuslines and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      palette_overrides = {
        light1 = "#d5c4a1",
      },
      overrides = {},
      dim_inactive = true,
      transparent_mode = false,
    },
    config = function(_, opts)
      local colors = require("gruvbox").palette
      opts.overrides = {
        Function = { fg = colors.bright_aqua },
        Keyword = { fg = colors.bright_red },
        Tag = { fg = colors.bright_red },
        Conceal = { fg = colors.gray },
        Qualifier = { fg = colors.bright_red },
        Title = { fg = colors.fg1, bold = true },
        ['@keyword.import'] = { fg = colors.bright_red },
      }

      require("gruvbox").setup(opts)
    end,
  },
}
