vim.pack.add({
	{
		src = "https://github.com/mrjones2014/smart-splits.nvim",
	},
})

require("smart-splits").setup({
	-- Movement
	vim.keymap.set("n", "<C-h>", function()
		require("smart-splits").move_cursor_left()
	end, { desc = "Move cursor left" }),
	vim.keymap.set("n", "<C-j>", function()
		require("smart-splits").move_cursor_down()
	end, { desc = "Move cursor down" }),
	vim.keymap.set("n", "<C-k>", function()
		require("smart-splits").move_cursor_up()
	end, { desc = "Move cursor up" }),
	vim.keymap.set("n", "<C-l>", function()
		require("smart-splits").move_cursor_right()
	end, { desc = "Move cursor right" }),
	-- Resize
	vim.keymap.set("n", "<M-h>", function()
		require("smart-splits").resize_left()
	end, { desc = "Resize left" }),
	vim.keymap.set("n", "<M-j>", function()
		require("smart-splits").resize_down()
	end, { desc = "Resize down" }),
	vim.keymap.set("n", "<M-k>", function()
		require("smart-splits").resize_up()
	end, { desc = "Resize up" }),
	vim.keymap.set("n", "<M-l>", function()
		require("smart-splits").resize_right()
	end, { desc = "Resize right" }),
})
