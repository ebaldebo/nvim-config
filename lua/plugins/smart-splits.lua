return {
	"mrjones2014/smart-splits.nvim",
	opts = {},
	keys = {
		-- Move cursor between splits
		{ "<C-h>", "<cmd>lua require('smart-splits').move_cursor_left()<CR>", desc = "Move cursor left" },
		{ "<C-j>", "<cmd>lua require('smart-splits').move_cursor_down()<CR>", desc = "Move cursor down" },
		{ "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<CR>", desc = "Move cursor up" },
		{ "<C-l>", "<cmd>lua require('smart-splits').move_cursor_right()<CR>", desc = "Move cursor right" },
		-- Resize splits
		{ "<C-S-h>", "<cmd>lua require('smart-splits').resize_left()<CR>", desc = "Resize left" },
		{ "<C-S-j>", "<cmd>lua require('smart-splits').resize_down()<CR>", desc = "Resize down" },
		{ "<C-S-k>", "<cmd>lua require('smart-splits').resize_up()<CR>", desc = "Resize up" },
		{ "<C-S-l>", "<cmd>lua require('smart-splits').resize_right()<CR>", desc = "Resize right" },
	},
}
