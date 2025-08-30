vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

local dmode_enabled = false
vim.api.nvim_create_autocmd("User", {
	pattern = "DebugModeChanged",
	callback = function(args)
		dmode_enabled = args.data.enabled
	end,
})

require("lualine").setup({
	options = {
		theme = "catppuccin",
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return dmode_enabled and "DEBUG" or str
				end,
			},
		},
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
			{
				"lsp_status",
				icon = "",
				symbols = {
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					done = "✓",
					separator = " ",
				},
				ignore_lsp = {},
			},
		},
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
