return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
	keys = {
		{
			"<leader>tr",
			"<cmd>Neotest run<cr>",
			desc = "[T]est [R]un",
		},
		{
			"<leader>to",
			"<cmd>Neotest output<cr>",
			desc = "[T]est [O]utput",
		},
		{
			"<leader>ts",
			"<cmd>Neotest summary<cr>",
			desc = "[T]est [S]ummary",
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
		local neotest_golang_opts = {}
		require("neotest").setup({
			adapters = {
				require("neotest-golang")(neotest_golang_opts),
			},
		})
	end,
}
