return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	opts = {
		provider = "copilot",
		-- provider = "openai",
		-- openai = {
		-- 	endpoint = "https://api.openai.com/v1",
		-- 	model = "o4-mini",
		-- 	timeout = 30000,
		-- 	temperature = 0,
		-- 	max_completion_tokens = 8192,
		-- 	--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
		-- },
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- "echasnovski/mini.pick",
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
