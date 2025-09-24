return {
	sleek = {
		-- command name (must be in your $PATH)
		command = "sleek",
		-- args to pass; can be a list or string
		-- e.g. you may want to pass --uppercase or disable trailing newline etc.
		args = {
			"--uppercase",
			"true",
			"--trailing-newline",
			"true",
			-- you can add more options as needed
		},
		-- whether to inherit default config or not
		inherit = false,
	},
}
