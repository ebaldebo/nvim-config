return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		integrations = {
			blink_cmp = true,
			fzf = true,
			gitsigns = {
				enabled = true,
				transparent = false,
			},
			mason = true,
			mini = {
				enabled = true,
				indentscope_color = "lavender",
			},
			neotest = true,
			dap = true,
			dap_ui = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			treesitter = true,
			snacks = {
				enabled = false,
				indent_scope_color = "lavender",
			},
			which_key = true,
		},
	},
}
