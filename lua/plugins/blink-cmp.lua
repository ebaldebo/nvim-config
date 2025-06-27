return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},

		completion = { documentation = { auto_show = true } },
		signature = { enabled = true },

		sources = {
			default = { "avante", "lsp", "path", "snippets", "buffer" },
			providers = {
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {},
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
