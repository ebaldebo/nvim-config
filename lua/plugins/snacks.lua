return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		input = {
			enabled = true,
			win = {
				relative = "cursor",
				row = 1,
				col = 0,
			},
		},
		picker = {
			enabled = true,
		},
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		indent = {
			enabled = true,
		},
		lazygit = {
			enabled = true,
		},
		terminal = {
			enabled = true,
		},
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>'",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
	},
}
