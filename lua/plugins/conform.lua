vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofumpt", "goimports" },
		nix = { "nixfmt" },
		-- ansible = { "ansible-lint" },
		-- rust = { "rustfmt" },
		-- cpp = { "clang_format" },
	},
	format_on_save = {
		timeout_ms = 3000,
		lsp_format = "fallback",
	},
})
