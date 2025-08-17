vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/kristijanhusak/vim-dadbod-ui",
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/kristijanhusak/vim-dadbod-completion",
})

vim.keymap.set("n", "<leader>sq", ":DBUIToggle<CR>", { desc = "Toggle Dadbod UI" })
