return {
	{
  		'nvim-treesitter/nvim-treesitter',
		branch = "main",
  		lazy = false,
		build = ':TSUpdate',

		opts = {
			ensure_installed = {
				"lua",
				"python",
				"bash",
				"vim",
				"vimdoc",
				"query",
				"cpp",
				"json",
				"yaml",
				"toml",
				"markdown",
				"markdown_inline",
				-- add more here when needed
			},

			auto_install = true,

			highlight = {
				enabled = true,
			},

			indent = {
				enabled = true,
			},
		},
	},
}
