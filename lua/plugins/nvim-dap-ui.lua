vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/jbyuki/one-small-step-for-vimkind",
	-- Adapters
	"https://github.com/leoluz/nvim-dap-go",
})

local dap, dapui = require("dap"), require("dapui")

dapui.setup()

-- Auto open/close UI with debug sessions
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- Debug keymaps (<leader>d namespace)
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: [C]ontinue" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step [O]ver" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step [I]nto" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug: Step [O]ut" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle [B]reakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional [B]reakpoint" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle [U]I" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: [R]estart" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Debug: [Q]uit/Terminate" })
vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "Debug: [E]val Expression" })
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Go adapter
require("dap-go").setup({
	delve = {
		path = vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "dlv",
	},
})

-- Lua adapter (one-small-step-for-vimkind)
dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
	},
}
