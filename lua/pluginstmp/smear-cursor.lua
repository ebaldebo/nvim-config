vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")

vim.pack.add({
	{
		src = "https://github.com/sphamba/smear-cursor.nvim",
	},
})

require("smear_cursor").setup()
