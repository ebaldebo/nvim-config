vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/ebaldebo/project-finder.nvim",
})

require("fzf-lua").setup({})
require("project-finder").setup()

vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "[F]ind [F]iles in project directory" })

vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "[F]ind [G]rep in project directory" })

vim.keymap.set("n", "<leader>fc", function()
	require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind in Neovim [C]onfig" })

vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").helptags()
end, { desc = "[F]ind in [H]elp" })

vim.keymap.set("n", "<leader>fk", function()
	require("fzf-lua").keymaps()
end, { desc = "[F]ind in [K]eymaps" })

vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").builtin()
end, { desc = "[F]ind in [B]uiltin FZF" })

vim.keymap.set("n", "<leader>fw", function()
	require("fzf-lua").grep_cword()
end, { desc = "[F]ind in [W]ord" })

vim.keymap.set("n", "<leader>fW", function()
	require("fzf-lua").grep_cWORD()
end, { desc = "[F]ind in [W]ORD" })

vim.keymap.set("n", "<leader>fd", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "[F]ind in [D]iagnostics" })

vim.keymap.set("n", "<leader>fr", function()
	require("fzf-lua").resume()
end, { desc = "[F]ind in [R]esume" })

vim.keymap.set("n", "<leader>fo", function()
	require("fzf-lua").oldfiles()
end, { desc = "[F]ind in [O]ld files" })

vim.keymap.set("n", "<leader><leader>", function()
	require("fzf-lua").buffers()
end, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
	require("fzf-lua").lgrep_curbuf()
end, { desc = "[/] Live grep current buffer" })

vim.keymap.set("n", "<leader>fp", function()
	local display_projects, project_paths = require("project-finder").get_display_projects()
	require("fzf-lua").fzf_exec(display_projects, {
		prompt = "Projects> ",
		actions = {
			["default"] = function(selected)
				if #selected > 0 then
					-- Find the corresponding full path
					local selected_display = selected[1]
					for i, display_name in ipairs(display_projects) do
						if display_name == selected_display then
							require("project-finder").change_to_project(project_paths[i])
							break
						end
					end
				end
			end,
		},
	})
end, { desc = "[F]ind [P]rojects" })
