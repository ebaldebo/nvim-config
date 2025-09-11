vim.pack.add({
	{
		src = "https://github.com/oribarilan/lensline.nvim",
		version = "release/1.x",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lensline-setup", { clear = true }),
	once = true,
	callback = function()
		require("lensline").setup()
	end,
})
