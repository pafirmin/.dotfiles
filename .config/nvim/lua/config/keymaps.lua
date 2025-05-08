local function opts(desc)
	return { desc = desc, noremap = true, silent = true }
end

local keymap = vim.keymap.set

keymap("", "Y", "y$", opts("Yank to end of line"))

keymap("n", "<leader>u", vim.cmd.UndotreeToggle, opts("Toggle UndoTree"))

keymap("n", "q:", "<nop>", opts(""))

-- resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts("Increase vertical window size"))
keymap("n", "<C-Down>", ":resize -2<CR>", opts("Descrease vertical window size"))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts("Decrease horizontal window size"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts("Increase horizontal window size"))

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts("Next buffer"))
keymap("n", "<S-h>", ":bprevious<CR>", opts("Prev buffer"))
keymap("n", "<leader>bd", ":bdelete<CR>", opts("Close buffer"))
keymap("n", "<leader>bb", ":BufferLinePick<CR>", opts("Pick buffer"))

-- Navigate tabs
keymap("n", "<A-l>", "gt", opts("Next tab"))
keymap("n", "<A-h>", "gT", opts("Prev tab"))

-- line shifting
keymap("n", "<A-DOWN>", ":m .+1<CR>==", opts("Shift line down"))
keymap("n", "<A-UP>", ":m .-2<CR>==", opts("Shift line up"))
keymap("v", "<A-DOWN>", ":m '>+1<CR>gv=gv", opts("Shift line down"))
keymap("v", "<A-UP>", ":m '<-2<CR>gv-gv", opts("Shift line up"))

-- Keep cursor centered when moving up/down half a page
keymap("n", "<C-d>", "<C-d>zz", opts(""))
keymap("n", "<C-u>", "<C-u>zz", opts(""))

-- Jump to definition in new split
keymap("n", "gv", ":vsplit<CR><C-]>", opts("Open definition in new split"))

-- quick replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- copy/paste from system clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
keymap("x", "<leader>p", [["_dP]])

-- visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts(""))
keymap("v", ">", ">gv", opts(""))

-- maintain yanked text on visual mode put
keymap("v", "p", '"_dP', opts(""))

keymap("n", "<leader>gb", ":Git blame<CR>", opts("Show git blame"))

vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("Wqa", "wqa", { nargs = 0 })
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Wa", "wa", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })
vim.api.nvim_create_user_command("Qa", "qa", { nargs = 0 })
