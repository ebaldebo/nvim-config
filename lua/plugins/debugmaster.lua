vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/jbyuki/one-small-step-for-vimkind",
	"https://github.com/miroshQa/debugmaster.nvim",
	-- Adapters
	"https://github.com/leoluz/nvim-dap-go",
})

-- local dap = require("dap")
local dm = require("debugmaster")

vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true, desc = "Toggle debug" })
vim.keymap.set("n", "<Esc>", dm.mode.disable)
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Adapter configs
require("dap-go").setup({
	delve = {
		path = vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "dlv",
	},
})
