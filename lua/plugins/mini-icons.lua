vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/echasnovski/mini.icons",
})

require("mini.icons").setup()
