vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("render-markdown").setup()
