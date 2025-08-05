vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	-- UI for nvim-dap
	"https://github.com/rcarriga/nvim-dap-ui",
	-- Required dependency for nvim-dap
	"https://github.com/nvim-neotest/nvim-nio",
	-- Language specific debug adapters
	"https://github.com/leoluz/nvim-dap-go",
	-- Virtual text for nvim-dap
	"https://github.com/theHamsta/nvim-dap-virtual-text",
})

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

vim.keymap.set("n", "<space>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Debug Toggle breakpoint" })

vim.keymap.set("n", "<space>dk", function()
	require("dapui").eval(nil, { enter = true })
end, { desc = "Debug evaluate" })

vim.keymap.set("n", "<space>dc", function()
	require("dap").continue()
end, { desc = "Debug Start/Continue" })

vim.keymap.set("n", "<space>dC", function()
	require("dap").terminate()
	require("dapui").close()
end, { desc = "Debug Stop" })

vim.keymap.set("n", "<space>di", function()
	require("dap").step_into()
end, { desc = "Debug Step into" })

vim.keymap.set("n", "<space>dI", function()
	require("dap").step_out()
end, { desc = "Debug Step out" })

vim.keymap.set("n", "<space>do", function()
	require("dap").step_over()
end, { desc = "Debug Step over" })

vim.keymap.set("n", "<space>dr", function()
	require("dap").restart()
end, { desc = "Debug Restart" })
