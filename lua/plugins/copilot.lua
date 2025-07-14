return {
	"zbirenbaum/copilot.lua",
	opts = {
		filetypes = {
			["*"] = true,
		},
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<C-j>",
				next = "<C-n>",
				previous = "<C-p>",
			},
		},
	},
}
