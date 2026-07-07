local map = vim.keymap.set

map("n", "<leader>zm", "<cmd>CellularAutomaton make_it_rain<CR>", {
	desc = "Make it rain",
})

map("n", "<leader>zg", "<cmd>CellularAutomaton game_of_life<CR>", {
	desc = "Game of Life",
})

map("n", "<leader>zs", "<cmd>CellularAutomaton scramble<CR>", {
	desc = "Scramble",
})
