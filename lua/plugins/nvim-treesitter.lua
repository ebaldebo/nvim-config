vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		version = "main",
	},
})

require("nvim-treesitter").setup({})

-- Auto-install parsers when opening a file with no parser
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter-auto-install", { clear = true }),
	callback = function()
		local ft = vim.bo.filetype
		if ft == "" or not require("nvim-treesitter.parsers")[ft] then
			return
		end
		if not pcall(vim.treesitter.language.inspect, ft) then
			pcall(require("nvim-treesitter").install, { ft })
		end
	end,
})

-- Enable treesitter highlighting and indentation for all supported filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter-features", { clear = true }),
	callback = function()
		pcall(vim.treesitter.start)
		if pcall(vim.treesitter.language.inspect, vim.bo.filetype) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- Textobjects
require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v",
			["@function.outer"] = "V",
			["@class.outer"] = "<c-v>",
		},
		include_surrounding_whitespace = true,
	},
})

vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "Select around function" })
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "Select inside function" })
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "Select around class" })
vim.keymap.set({ "x", "o" }, "ao", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
end, { desc = "Select around comment" })


