return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = true,
		integrations = {
			fzf = true,
			gitsigns = {
				enabled = true,
				transparent = false,
			},
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
		custom_highlights = function(colors)
			return {
				-- Native completion popup menu
				Pmenu = { bg = colors.surface0, fg = colors.text },
				PmenuSel = { bg = colors.surface1, fg = colors.text, style = { "bold" } },
				PmenuSbar = { bg = colors.surface1 },
				PmenuThumb = { bg = colors.overlay0 },

				-- Completion item kinds (LSP)
				PmenuKind = { bg = colors.surface0, fg = colors.lavender },
				PmenuKindSel = { bg = colors.surface1, fg = colors.lavender, style = { "bold" } },
				PmenuExtra = { bg = colors.surface0, fg = colors.subtext1 },
				PmenuExtraSel = { bg = colors.surface1, fg = colors.subtext1 },
			}
		end,
	},
}
