vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

local function cwd_name()
	return vim.fs.basename(vim.fn.getcwd())
end

require("lualine").setup({
	options = {
		theme = "catppuccin-nvim",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			cwd_name,
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
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
