vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/nmac427/guess-indent.nvim",
})

require("guess-indent").setup()
