vim.pack.add({
	"https://github.com/saghen/blink.cmp",
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<Tab>"] = {
			"snippet_forward",
			function()
				return vim.lsp.inline_completion.get()
			end,
			"fallback",
		},
	},
	appearance = {
		nerd_font_variant = "mono",
	},

	completion = { documentation = { auto_show = true } },
	signature = { enabled = true },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "lua" },
})
