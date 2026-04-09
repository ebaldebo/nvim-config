vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofumpt", "goimports" },
		nix = { "nixfmt" },
		python = { "ruff" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		svelte = { "prettierd" },
		yaml = { "yamlfmt" },
		-- ansible = { "ansible-lint" },
		-- rust = { "rustfmt" },
		-- cpp = { "clang_format" },
	},
	format_on_save = {
		timeout_ms = 3000,
		lsp_format = "fallback",
	},
})
