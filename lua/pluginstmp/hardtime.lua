vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/m4xshen/hardtime.nvim",
	-- Dependencies
	"https://github.com/MunifTanjim/nui.nvim",
})

require("hardtime").setup()
