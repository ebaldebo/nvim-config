return {
	cmd = { "nil" },
	autostart = true,
	filetypes = { "nix" },
	single_file_support = true,
	root_markers = {
		"flake.nix",
		"configuration.nix",
		".git",
	},
}
