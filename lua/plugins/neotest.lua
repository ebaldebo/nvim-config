return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "[T]est Nearest",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "[T]est [O]utput",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "[T]est [Debug] nearest",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang")({
					dap_go_opts = {
						mode = "test",
					},
				}),
			},
			output = {
				open_on_run = false,
			},

			diagnostic = {
				enabled = true,
			},
		})
	end,
}
