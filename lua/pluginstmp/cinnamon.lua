-- Ensure the user data directory is in packpath
vim.opt.packpath:prepend(vim.fn.stdpath('data') .. '/site')

vim.pack.add({
	{
		src = "https://github.com/declancm/cinnamon.nvim",
	},
})
