vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	{
		src = "https://github.com/folke/snacks.nvim",
	},
})

require("snacks").setup({
	input = {
		enabled = true,
		win = {
			relative = "cursor",
			row = 1,
			col = 0,
		},
	},
	picker = {
		enabled = true,
	},
	indent = {
		enabled = true,
	},
	lazygit = {
		enabled = true,
	},
	terminal = {
		enabled = true,
	},

	vim.keymap.set("n", "<leader>lg", function()
		require("snacks").lazygit()
	end, { desc = "Lazygit" }),

	vim.keymap.set("n", "<leader>'", function()
		require("snacks").terminal()
	end, { desc = "Toggle Terminal" }),
})
