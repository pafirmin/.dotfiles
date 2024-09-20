return {
	{
		"leoluz/nvim-dap-go",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap" },
		ft = "go",
		config = function()
			local dapgo = require("dap-go")
			dapgo.setup()
			vim.keymap.set("n", "<leader>dt", dapgo.debug_test, { desc = "Debug go test" })
		end,
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				automatic_setup = true,
				handlers = {},
				ensure_installed = {
					"delve",
				},
			})

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<F8>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F9>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
			vim.keymap.set("n", "<localleader>dC", function()
				dap.clear_breakpoints()
			end)
			vim.keymap.set("n", "<localleader>de", function()
				dap.clear_breakpoints()
				dapui.toggle({})
				dap.terminate()
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
			end)

			-- Dap UI setup
			-- For more information, see |:help nvim-dap-ui|
			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			vim.keymap.set("n", "<F6>", dapui.toggle, { desc = "Debug: See last session result." })

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close
		end,
	},
}
