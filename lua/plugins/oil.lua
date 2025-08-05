vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
