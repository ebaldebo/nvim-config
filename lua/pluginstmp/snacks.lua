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
	dashboard = {
		enabled = true,
		sections = {
			{ section = "header" },
			{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
			{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
			{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
			{ section = "startup" },
		},
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
