local num_toggle_group = vim.api.nvim_create_augroup("numbertoggle", {})

-- Use relative line numbers in normal mode
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	pattern = "*",
	group = num_toggle_group,
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})

-- Revert to absolute line numbers in insert mode
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	pattern = "*",
	group = num_toggle_group,
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})

local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
vim.api.nvim_create_autocmd("User", {
	pattern = "NvimTreeSetup",
	callback = function()
		local events = require("nvim-tree.api").events
		events.subscribe(events.Event.NodeRenamed, function(data)
			if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
				data = data
				require("snacks").rename.on_rename_file(data.old_name, data.new_name)
			end
		end)
	end,
})
