vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	{
		src = "https://github.com/echasnovski/mini.statusline",
		version = "stable",
	},
})

require("mini.statusline").setup({})
