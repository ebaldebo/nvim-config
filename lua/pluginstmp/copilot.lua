vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/zbirenbaum/copilot.lua",
})

require("copilot").setup({
	filetypes = {
		["*"] = true,
	},
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<C-j>",
			next = "<C-n>",
			previous = "<C-p>",
		},
	},
})
