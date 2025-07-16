return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI
			"rcarriga/nvim-dap-ui",
			-- Required dependency for nvim-dap
			"nvim-neotest/nvim-nio",
			-- Language specific debug adapters
			"leoluz/nvim-dap-go",
			-- Virtual text for nvim-dap
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{
				"<space>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug Toggle breakpoint",
			},
			{
				"<space>dk",
				function()
					require("dapui").eval(nil, { enter = true })
				end,
				desc = "Debug evaluate",
			},
			{
				"<space>dc",
				function()
					require("dap").continue()
				end,
				desc = "Debug Start/Continue",
			},
			{
				"<space>dC",
				function()
					require("dap").terminate()
					require("dapui").close()
				end,
				desc = "Debug Stop",
			},
			{
				"<space>di",
				function()
					require("dap").step_into()
				end,
				desc = "Debug Step into",
			},
			{
				"<space>dI",
				function()
					require("dap").step_out()
				end,
				desc = "Debug Step out",
			},
			{
				"<space>do",
				function()
					require("dap").step_over()
				end,
				desc = "Debug Step over",
			},
			{
				"<space>dr",
				function()
					require("dap").restart()
				end,
				desc = "Debug Restart",
			},
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

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

			require("nvim-dap-virtual-text").setup()

			require("dap-go").setup({
				delve = {
					path = vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "dlv",
				},
			})
		end,
	},
}
