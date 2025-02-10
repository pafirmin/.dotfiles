local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

local keymap = vim.keymap.set

keymap("", "Y", "y$", opts("Yank to end of line"))

-- keymap("n", "<C-h>", "<C-w>h", opts("Left one window"))
-- keymap("n", "<C-j>", "<C-w>j", opts("Right one window"))
-- keymap("n", "<C-k>", "<C-w>k", opts("Up one window"))
-- keymap("n", "<C-l>", "<C-w>l", opts("Down on window"))
--
keymap(
  "n",
  "<leader>gg",
  "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
  opts("opens lazygit")
)

keymap("n", "<leader>u", vim.cmd.UndotreeToggle, opts("Toggle UndoTree"))

keymap("n", "q:", "<nop>", opts(""))

-- resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts("Increase vertical window size"))
keymap("n", "<C-Down>", ":resize -2<CR>", opts("Descrease vertical window size"))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts("Decrease horizontal window size"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts("Increase horizontal window size"))

keymap(
  "n",
  "gx",
  [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]],
  opts("Open link under cursor in broser")
)

-- Nvim-Tree
-- keymap("n", "<leader>\\", ":Oil --float<CR>", opts("Open Nvim Tree"))
keymap("n", "|", ":NvimTreeToggle<CR>", opts("Open Nvim Tree"))

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts("Next buffer"))
keymap("n", "<S-h>", ":bprevious<CR>", opts("Prev buffer"))
keymap("n", "<leader>bd", ":bdelete<CR>", opts("Close buffer"))
keymap("n", "<leader>bb", ":BufferLinePick<CR>", opts("Pick buffer"))

-- go to start/end of line with bs/space
keymap({ "n", "v" }, "<Space>", "$", opts("End of line"))
keymap({ "n", "v" }, "<BS>", "0", opts("Start of line"))

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
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- copy/paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

-- visual
-- Stay in indent mode
keymap("v", "<", "<gv", opts(""))
keymap("v", ">", ">gv", opts(""))

-- maintain yanked text on visual mode put
keymap("v", "p", '"_dP', opts(""))

vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("Wqa", "wqa", { nargs = 0 })
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Wa", "wa", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })
vim.api.nvim_create_user_command("Qa", "qa", { nargs = 0 })
