return {
	{
		"neovim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"neovim-treesitter/treesitter-parser-registry",
		},

		config = function()
			require("nvim-treesitter").setup()

			local langs = {
				lua = true,
				python = true,
				bash = true,
				vim = true,
				vimdoc = true,
				query = true,
				cpp = true,
				json = true,
				yaml = true,
				toml = true,
				markdown = true,
			}

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ft = vim.bo[args.buf].filetype
					if not langs[ft] then
						return
					end

					local lang = vim.treesitter.language.get_lang(ft) or ft
					if vim.treesitter.language.add(lang) then
						vim.treesitter.start(args.buf, lang)
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
