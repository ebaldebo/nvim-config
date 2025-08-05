vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	{
		src = "https://github.com/declancm/cinnamon.nvim",
		version = "master",
	},
})

require("cinnamon").setup({})
