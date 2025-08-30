vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
	},
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},

	completion = { documentation = { auto_show = true } },
	signature = { enabled = true },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			dadbod = {
				name = "Dadbod",
				module = "vim_dadbod_completion.blink",
			},
		},
		per_filetype = {
			sql = { "snippets", "dadbod", "buffer" },
		},
	},
	fuzzy = { implementation = "lua" },
})
