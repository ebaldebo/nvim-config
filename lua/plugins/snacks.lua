vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	indent = {
		enabled = true,
	},
	lazygit = {
		enabled = true,
	},
	terminal = {
		enabled = true,
	},
})

vim.keymap.set("n", "<leader>lg", function()
	require("snacks").lazygit()
end, { desc = "Lazygit" })

vim.keymap.set("n", "<leader>'", function()
	require("snacks").terminal()
end, { desc = "Toggle Terminal" })
