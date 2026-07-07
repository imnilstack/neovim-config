return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_organize_imports" },
				bash = { "shfmt" },
				cpp = { "clang_format" },
				json = { "prettier" },
				yaml = { "prettier" },
				toml = { "taplo" },
				markdown = { "prettier" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
