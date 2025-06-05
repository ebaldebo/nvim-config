return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

			require("nvim-dap-virtual-text").setup()

			vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "Debug Toggle [B]reakpoint" })
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Debug go to cursor" })

			-- Eval var under cursor
			vim.keymap.set("n", "<space>dv", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Debug evaluate" })

			vim.keymap.set("n", "<space>dc", dap.continue, { desc = "Debug Start/Continue" })
			vim.keymap.set("n", "<space>dC", function()
				dap.terminate()
				ui.close()
			end, { desc = "Debug Stop" })
			vim.keymap.set("n", "<space>di", dap.step_into, { desc = "Debug Step into" })
			vim.keymap.set("n", "<space>dI", dap.step_out, { desc = "Debug Step out" })
			vim.keymap.set("n", "<space>do", dap.step_over, { desc = "Debug Step over" })
			vim.keymap.set("n", "<space>dr", dap.restart, { desc = "Debug Restart" })

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
