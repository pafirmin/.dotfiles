local options = {
	backup = false, -- creates a backup file
	cmdheight = 0,
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = false, -- don't highlight matches on previous search pattern
	incsearch = true, -- but DO highlight matches while searching
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	colorcolumn = "80", -- show vertical bar at col 80
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 3, -- set number column width to 3 {default 2}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 12, -- start scrolling when cursor is n lines before the bottom
	sidescrolloff = 8,
	cursorline = true, -- highlight current line
	guicursor = "a:blinkwait100-blinkoff600-blinkon600,i-ci:ver25",
}

-- I think this means you don't have to press 'enter' to dismiss messages
-- like 'no matches found' but I don't really remember
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

if vim.fn.executable("rg") == 1 then
	vim.o.grepprg = "rg --vimgrep --hidden --glob '!.git'"
end
