vim.lsp.enable({
	"gopls",
	"golangci_lint_ls",
	"lua_ls",
	"nil_ls",
})

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = {
		source = "if_many",
		spacing = 2,
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Keymaps
		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gra", require("fzf-lua").lsp_code_actions, "[G]o to Code [A]ction")
		map("grr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")
		map("gri", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")
		map("grd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")
		map("grD", require("fzf-lua").lsp_declarations, "[G]oto [D]eclaration")
		map("gO", require("fzf-lua").lsp_document_symbols, "Document Symbols")
		map("gW", require("fzf-lua").lsp_live_workspace_symbols, "[W]orkspace Symbols")
		map("grt", require("fzf-lua").lsp_typedefs, "[T]ype Definition")
		map("gdd", require("fzf-lua").lsp_document_diagnostics, "[G]oto [D]ocument [D]iagnostics")
		map("gwd", require("fzf-lua").lsp_workspace_diagnostics, "[G]oto [W]orkspace [D]iagnostics")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			-- Highlighting
			vim.api.nvim_create_autocmd(
				{ "CursorHold", "CursorHoldI" },
				{ buffer = event.buf, group = highlight_augroup, callback = vim.lsp.buf.document_highlight }
			)
			vim.api.nvim_create_autocmd(
				{ "CursorMoved", "CursorMovedI" },
				{ buffer = event.buf, group = highlight_augroup, callback = vim.lsp.buf.clear_references }
			)
			-- Clear highlights on buffer unload
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

			local kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			}

			vim.lsp.completion.enable(true, client.id, event.buf, {
				autotrigger = true,
				convert = function(item)
					local kind = vim.lsp.protocol.CompletionItemKind[item.kind] or "Text"
					local icon = kind_icons[kind] or ""

					return {
						abbr = item.label,
						word = item.label,
						menu = icon,
					}
				end,
			})

			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end)
		end
	end,
})
