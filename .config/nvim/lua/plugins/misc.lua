return {
  { "tpope/vim-fugitive" },                 -- use git from inside nvim
  { "tpope/vim-repeat" },                   -- repeat plugin-specific commands with '.'
  { "tpope/vim-surround" },                 -- keymaps for surrounding text
  { "tpope/vim-speeddating" },              -- easily change dates
  { "tpope/vim-abolish" },                  -- powerful substitution tools
  { "tpope/vim-unimpaired" },               -- useful keymappings (https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt)
  { "mbbill/undotree" },                    -- <leader>u to view undo tree
  { "nvim-lua/plenary.nvim", lazy = true }, -- window utils, used by other plugins
  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = 'ZenMode',
    opts = {
      plugins = {
        tmux = { enabled = true },
        alacritty = { enabled = true },
      }
    },
  },
  {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup()
    end
  },
  {
    "folke/neodev.nvim",
    lazy = true,
    ft = 'lua',
  },                                   -- nvim config lsp completion
  {
    "alexghergh/nvim-tmux-navigation", -- navigate between tmux panes and vim windows
    opts = {
      disable_when_zoomed = true,      -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    },
  },
  {
    "L3MON4D3/LuaSnip", -- snippet engine
    lazy = true,
    version = "v2.*",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets/" } })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim", -- show vertical lines at indents
    main = "ibl",
    opts = {
      scope = {
        show_start = false,
        show_end = false,
      },
      indent = {
        char = { "│" }
      }
    },
  },
  {
    "windwp/nvim-ts-autotag", -- auto-close html/jsx tags
    lazy = true,
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "html", "typescriptreact" },
    config = true,
  },
  {
    "ggandor/leap.nvim", -- easily jump around files
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "X", "<Plug>(leap-backward-to)")
      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "markdown",
    cmd = "MarkdownPreview",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
