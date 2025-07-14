return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	opts = {
		provider = "copilot",
		providers = {
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "claude-sonnet-4",
				allow_insecure = false,
				timeout = 30000,
				extra_request_body = {
					temperature = 0,
					max_tokens = 20480,
				},
			},
		},
		input = {
			provider = "snacks",
			provider_opts = {
				title = "Avante Input",
				icon = "",
			},
		},
	},
	build = "make",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- Optional dependencies
		"folke/snacks.nvim",
		"ibhagwan/fzf-lua",
		"echasnovski/mini.icons",
		"zbirenbaum/copilot.lua",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				html = {
					enabled = false,
				},
				latex = {
					enabled = false,
				},
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
