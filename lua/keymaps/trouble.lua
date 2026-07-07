local map = vim.keymap.set

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", {
	desc = "Diagnostics",
})

map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", {
	desc = "Buffer diagnostics",
})

map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>", {
	desc = "References",
})
