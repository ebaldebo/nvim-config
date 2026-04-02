require("config.options")
require("config.globals")
require("config.lsp")
require("config.keymaps")
require("config.autocmds")

-- Plugin hooks (must be before any vim.pack.add() for bootstrap)
vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Update parsers when nvim-treesitter is updated",
	group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
	callback = function(event)
		if event.data.spec.name == "nvim-treesitter" and event.data.kind == "update" then
			if not event.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
			local ok = pcall(vim.cmd, "TSUpdate")
			if ok then
				vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
			else
				vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
			end
		end
	end,
})

-- Plugins --
require("plugins.plugin-view")
require("plugins.catppuccin")
require("plugins.nvim-lspconfig")
require("plugins.snacks")
require("plugins.mini-icons")
require("plugins.smart-splits")
require("plugins.blinkcmp")
require("plugins.fzflua")
require("plugins.lensline")
require("plugins.conform")
require("plugins.statusline")
require("plugins.oil")
require("plugins.which-key")
require("plugins.nvim-treesitter")
require("plugins.render-markdown")
require("plugins.nvim-dap-ui")
require("plugins.gitsigns")
require("plugins.guess-indent")
require("plugins.vim-dadbod")
