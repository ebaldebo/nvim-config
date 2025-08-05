vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

require("which-key").setup({
	vim.keymap.set("n", "<leader>?", function()
		require("which-key").show({ global = false })
	end, { desc = "Show keybindings" }),
})
