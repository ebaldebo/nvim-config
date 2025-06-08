return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	opts = {
		provider = "copilot",
		providers = {
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "claude-3.7-sonnet",
				allow_insecure = false,
				timeout = 30000,
				extra_request_body = {
					temperature = 0,
					max_tokens = 20480,
				},
			},
		},
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
